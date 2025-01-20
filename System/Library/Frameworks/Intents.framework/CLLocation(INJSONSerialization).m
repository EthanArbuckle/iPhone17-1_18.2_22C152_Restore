@interface CLLocation(INJSONSerialization)
+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:;
- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:;
@end

@implementation CLLocation(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setObject:v6 forKey:@"coordinate"];
  v7 = NSNumber;
  [a1 coordinate];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v9 = [v4 encodeObject:v8];
  [v5 setValue:v9 forKeyPath:@"coordinate.latitude"];

  v10 = NSNumber;
  [a1 coordinate];
  v12 = [v10 numberWithDouble:v11];
  v13 = [v4 encodeObject:v12];
  [v5 setValue:v13 forKeyPath:@"coordinate.longitude"];

  [a1 altitude];
  if (v14 < 0.0)
  {
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", 0, @"altitude");
  }
  else
  {
    v15 = NSNumber;
    [a1 altitude];
    v16 = objc_msgSend(v15, "numberWithDouble:");
    v17 = [v4 encodeObject:v16];
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v17, @"altitude");
  }
  [a1 horizontalAccuracy];
  if (v18 < 0.0)
  {
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", 0, @"horizontalAccuracy");
  }
  else
  {
    v19 = NSNumber;
    [a1 horizontalAccuracy];
    v20 = objc_msgSend(v19, "numberWithDouble:");
    v21 = [v4 encodeObject:v20];
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v21, @"horizontalAccuracy");
  }
  [a1 verticalAccuracy];
  if (v22 < 0.0)
  {
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", 0, @"verticalAccuracy");
  }
  else
  {
    v23 = NSNumber;
    [a1 verticalAccuracy];
    v24 = objc_msgSend(v23, "numberWithDouble:");
    v25 = [v4 encodeObject:v24];
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v25, @"verticalAccuracy");
  }
  [a1 course];
  if (v26 < 0.0)
  {
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", 0, @"course");
  }
  else
  {
    v27 = NSNumber;
    [a1 course];
    v28 = objc_msgSend(v27, "numberWithDouble:");
    v29 = [v4 encodeObject:v28];
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v29, @"course");
  }
  [a1 speed];
  if (v30 < 0.0)
  {
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", 0, @"speed");
  }
  else
  {
    v31 = NSNumber;
    [a1 speed];
    v32 = objc_msgSend(v31, "numberWithDouble:");
    v33 = [v4 encodeObject:v32];
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v33, @"speed");
  }
  v34 = [v4 _storedConfiguration];
  int v35 = [v34 locationIncludesTimestamp];

  if (v35)
  {
    v36 = [a1 timestamp];
    v37 = [v4 encodeObject:v36];
    objc_msgSend(v5, "if_setObjectIfNonNil:forKey:", v37, @"timestamp");
  }

  return v5;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [v9 objectForKeyedSubscript:@"coordinate"];
      if (v10)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v57 = 0;
          v56 = v9;
          goto LABEL_23;
        }
        uint64_t v12 = objc_opt_class();
        v13 = [v9 valueForKeyPath:@"coordinate.latitude"];
        double v14 = [v7 decodeObjectOfClass:v12 from:v13];
        [v14 doubleValue];
        CLLocationDegrees v16 = v15;

        uint64_t v17 = objc_opt_class();
        double v18 = [v9 valueForKeyPath:@"coordinate.longitude"];
        v19 = [v7 decodeObjectOfClass:v17 from:v18];
        [v19 doubleValue];
        CLLocationDegrees v21 = v20;

        uint64_t v22 = objc_opt_class();
        v23 = [v9 valueForKeyPath:@"altitude"];
        v24 = [v7 decodeObjectOfClass:v22 from:v23];
        [v24 doubleValue];
        double v26 = v25;

        uint64_t v27 = objc_opt_class();
        v28 = [v9 valueForKeyPath:@"horizontalAccuracy"];
        v29 = [v7 decodeObjectOfClass:v27 from:v28];
        double v30 = v29;
        if (!v29) {
          v29 = &unk_1EDBA7450;
        }
        [v29 doubleValue];
        double v32 = v31;

        uint64_t v33 = objc_opt_class();
        v34 = [v9 valueForKeyPath:@"verticalAccuracy"];
        int v35 = [v7 decodeObjectOfClass:v33 from:v34];
        v36 = v35;
        if (!v35) {
          int v35 = &unk_1EDBA7450;
        }
        [v35 doubleValue];
        double v38 = v37;

        uint64_t v39 = objc_opt_class();
        v40 = [v9 valueForKeyPath:@"course"];
        v41 = [v7 decodeObjectOfClass:v39 from:v40];
        v42 = v41;
        if (!v41) {
          v41 = &unk_1EDBA7450;
        }
        [v41 doubleValue];
        double v44 = v43;

        uint64_t v45 = objc_opt_class();
        v46 = [v9 valueForKeyPath:@"speed"];
        v47 = [v7 decodeObjectOfClass:v45 from:v46];
        v48 = v47;
        if (!v47) {
          v47 = &unk_1EDBA7450;
        }
        [v47 doubleValue];
        double v50 = v49;

        uint64_t v51 = objc_opt_class();
        v52 = [v9 valueForKeyPath:@"timestamp"];
        v53 = [v7 decodeObjectOfClass:v51 from:v52];
        v54 = v53;
        if (v53)
        {
          id v55 = v53;
        }
        else
        {
          id v55 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
        }
        v10 = v55;

        id v58 = objc_alloc(MEMORY[0x1E4F1E5F0]);
        CLLocationCoordinate2D v59 = CLLocationCoordinate2DMake(v16, v21);
        v57 = objc_msgSend(v58, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v10, v59.latitude, v59.longitude, v26, v32, v38, v44, v50);
      }
      else
      {
        v57 = 0;
      }
      v56 = v9;
    }
    else
    {
      v56 = 0;
      v57 = 0;
      v10 = v9;
    }
  }
  else
  {
    v10 = 0;
    v56 = 0;
    v57 = 0;
  }

LABEL_23:

  return v57;
}

@end