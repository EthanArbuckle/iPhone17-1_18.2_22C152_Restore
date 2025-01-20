@interface VNObjectTracker
+ (Class)trackerObservationClass;
- (id)_parseInputObservations:(id)a3 imageBuffer:(id)a4 error:(id *)a5;
@end

@implementation VNObjectTracker

+ (Class)trackerObservationClass
{
  return (Class)objc_opt_class();
}

- (id)_parseInputObservations:(id)a3 imageBuffer:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 uuid];
    v8 = (void *)v7;
    if (v7)
    {
      uint64_t v13 = v7;
      [v6 boundingBox];
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v16);
      v14[0] = DictionaryRepresentation;
      a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    }
    else if (a5)
    {
      v11 = [NSString stringWithFormat:@"Object identifier is not initialized in detected object observation"];
      *a5 = +[VNError errorWithCode:5 message:v11];

      a5 = 0;
    }
  }
  else if (a5)
  {
    v10 = [NSString stringWithFormat:@"VNDetectedObjectObservation object is expected to initialize Object Tracker"];
    *a5 = +[VNError errorWithCode:5 message:v10];

    a5 = 0;
  }

  return a5;
}

@end