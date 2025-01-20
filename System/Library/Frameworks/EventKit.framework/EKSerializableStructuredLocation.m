@interface EKSerializableStructuredLocation
+ (id)classesForKey;
- (CalLocation)calLocation;
- (EKSerializableStructuredLocation)initWithStructuredLocation:(id)a3;
- (id)createStructuredLocation;
- (void)setCalLocation:(id)a3;
@end

@implementation EKSerializableStructuredLocation

+ (id)classesForKey
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"calLocation";
  uint64_t v5 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:1];
  v7[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v3;
}

- (EKSerializableStructuredLocation)initWithStructuredLocation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKSerializableStructuredLocation;
  uint64_t v5 = [(EKSerializableStructuredLocation *)&v8 init];
  if (v5)
  {
    v6 = [v4 calLocation];
    [(EKSerializableStructuredLocation *)v5 setCalLocation:v6];
  }
  return v5;
}

- (id)createStructuredLocation
{
  v2 = [(EKSerializableStructuredLocation *)self calLocation];
  v3 = +[EKStructuredLocation locationWithCalLocation:v2];

  return v3;
}

- (CalLocation)calLocation
{
  return self->_calLocation;
}

- (void)setCalLocation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end