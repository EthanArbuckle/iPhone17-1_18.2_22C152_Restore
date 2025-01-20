@interface AXNamedReplayableGesture
+ (BOOL)supportsSecureCoding;
+ (id)_fingerIdentifierForFingerAtIndex:(unint64_t)a3;
+ (id)gestureWithLegacyFormatDictionary:(id)a3;
+ (id)gestureWithPoints:(id)a3 times:(id)a4 forces:(id)a5;
- (AXNamedReplayableGesture)initWithCoder:(id)a3;
- (BOOL)hasLocalizableName;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPerformAtOriginalLocation;
- (NSString)name;
- (id)gestureShiftedByOffset:(CGPoint)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHasLocalizableName:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setShouldPerformAtOriginalLocation:(BOOL)a3;
@end

@implementation AXNamedReplayableGesture

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXNamedReplayableGesture)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXNamedReplayableGesture;
  v5 = [(AXReplayableGesture *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
    v7 = *(void **)&v5->_hasLocalizableName;
    *(void *)&v5->_hasLocalizableName = v6;

    *(&v5->super.super._arePointsDeviceRelative + 1) = [v4 decodeBoolForKey:@"HasLocalizableName"];
    *(&v5->super.super._arePointsDeviceRelative + 2) = [v4 decodeBoolForKey:@"ShouldPerformAtOriginalLocation"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXNamedReplayableGesture;
  id v4 = a3;
  [(AXReplayableGesture *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", *(void *)&self->_hasLocalizableName, @"Name", v5.receiver, v5.super_class);
  [v4 encodeBool:*((unsigned __int8 *)&self->super.super._arePointsDeviceRelative + 1) forKey:@"HasLocalizableName"];
  [v4 encodeBool:*((unsigned __int8 *)&self->super.super._arePointsDeviceRelative + 2) forKey:@"ShouldPerformAtOriginalLocation"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    objc_super v5 = (void **)v4;
    uint64_t v6 = *(void **)&self->_hasLocalizableName;
    if ((v6 == v5[3] || objc_msgSend(v6, "isEqualToString:"))
      && *((unsigned __int8 *)&self->super.super._arePointsDeviceRelative + 1) == *((unsigned __int8 *)v5 + 17)
      && *((unsigned __int8 *)&self->super.super._arePointsDeviceRelative + 2) == *((unsigned __int8 *)v5 + 18))
    {
      v9.receiver = self;
      v9.super_class = (Class)AXNamedReplayableGesture;
      BOOL v7 = [(AXReplayableGesture *)&v9 isEqual:v5];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)gestureShiftedByOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(AXReplayableGesture *)self arePointsDeviceRelative]) {
    _AXAssert();
  }
  id v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(AXNamedReplayableGesture *)self name];
  [v5 setName:v6];

  objc_msgSend(v5, "setHasLocalizableName:", -[AXNamedReplayableGesture hasLocalizableName](self, "hasLocalizableName"));
  objc_msgSend(v5, "setShouldPerformAtOriginalLocation:", -[AXNamedReplayableGesture shouldPerformAtOriginalLocation](self, "shouldPerformAtOriginalLocation"));
  NSUInteger v30 = [(NSArray *)self->super.super._allEvents count];
  if (v30)
  {
    for (uint64_t i = 0; i != v30; ++i)
    {
      v8 = [(NSArray *)self->super.super._allEvents objectAtIndexedSubscript:i];
      objc_super v9 = [v8 objectForKeyedSubscript:@"Time"];
      [v9 doubleValue];
      double v11 = v10;

      v12 = [(NSArray *)self->super.super._allEvents objectAtIndexedSubscript:i];
      v13 = [v12 objectForKeyedSubscript:@"Forces"];

      v14 = [(NSArray *)self->super.super._allEvents objectAtIndexedSubscript:i];
      v15 = [v14 objectForKeyedSubscript:@"Fingers"];
      v16 = (void *)[v15 mutableCopy];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v17 = [v16 allKeys];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * j);
            v23 = [v16 objectForKeyedSubscript:v22];
            [v23 axCGPointValue];
            double v25 = v24;
            double v27 = v26;

            v28 = objc_msgSend(MEMORY[0x1E4F29238], "axValueWithCGPoint:", x + v25, y + v27);
            [v16 setObject:v28 forKeyedSubscript:v22];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v19);
      }

      [v5 addPointsByFingerIdentifier:v16 forces:v13 atTime:v11];
    }
  }

  return v5;
}

+ (id)_fingerIdentifierForFingerAtIndex:(unint64_t)a3
{
  return (id)[NSNumber numberWithUnsignedInteger:a3 + 1];
}

+ (id)gestureWithLegacyFormatDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"Points"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"Times"];
  BOOL v7 = [v4 objectForKeyedSubscript:@"Forces"];
  v8 = [a1 gestureWithPoints:v5 times:v6 forces:v7];
  objc_super v9 = [v4 objectForKeyedSubscript:@"IsDoubleTap"];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    if ([v8 numberOfEvents] != 2) {
      _AXAssert();
    }
    if ([v8 numberOfEvents] == 2)
    {
      [v8 _removeFingersAtEventIndex:1];
      [v8 timeAtEventIndex:0];
      double v12 = v11;
      [v8 timeAtEventIndex:1];
      double v14 = v13;
      double v15 = v13 - v12;
      v16 = [v8 _pointsByFingerIdentifierAtEventIndex:0];
      v17 = [v8 _forcesByFingerIdentifierAtEventIndex:0];
      [v8 addPointsByFingerIdentifier:v16 forces:v17 atTime:v14 + 0.05];

      [v8 addPointsByFingerIdentifier:MEMORY[0x1E4F1CC08] forces:MEMORY[0x1E4F1CC08] atTime:v14 + 0.05 + v15];
    }
  }
  uint64_t v18 = [v4 objectForKeyedSubscript:@"Name"];
  [v8 setName:v18];

  uint64_t v19 = [v4 objectForKeyedSubscript:@"HasLocalizableName"];
  objc_msgSend(v8, "setHasLocalizableName:", objc_msgSend(v19, "BOOLValue"));

  uint64_t v20 = [v4 objectForKeyedSubscript:@"ShouldPerformAtOriginalLocation"];
  objc_msgSend(v8, "setShouldPerformAtOriginalLocation:", objc_msgSend(v20, "BOOLValue"));

  return v8;
}

+ (id)gestureWithPoints:(id)a3 times:(id)a4 forces:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v36 = a1;
  id v11 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = -1;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __59__AXNamedReplayableGesture_gestureWithPoints_times_forces___block_invoke;
  v37[3] = &unk_1E5588598;
  v37[4] = &v42;
  v37[5] = &v38;
  [v8 enumerateObjectsUsingBlock:v37];
  unint64_t v12 = v39[3];
  if ((v12 & 0x8000000000000000) != 0 || v12 >= [v9 count])
  {
    double v13 = 0;
  }
  else
  {
    double v13 = [v9 objectAtIndexedSubscript:v39[3]];
  }
  long long v35 = v9;
  uint64_t v14 = [v8 count];
  double v15 = [v13 firstObject];
  [v15 doubleValue];
  double v17 = v16;

  uint64_t v18 = v43;
  if (v43[3] >= 1)
  {
    unint64_t v19 = 0;
    do
    {
      if (v14 >= 1)
      {
        for (unint64_t i = 0; i != v14; ++i)
        {
          v21 = [v8 objectAtIndex:i];
          if (i >= [v10 count])
          {
            uint64_t v22 = 0;
          }
          else
          {
            uint64_t v22 = [v10 objectAtIndex:i];
          }
          if (v19 < [v21 count])
          {
            v23 = [v21 objectAtIndex:v19];
            double v24 = AX_CGPointFromString(v23);
            double v26 = v25;

            double v27 = 0.0;
            double v28 = 0.0;
            if (v19 < [v22 count])
            {
              v29 = [v22 objectAtIndexedSubscript:v19];
              [v29 doubleValue];
              double v28 = v30;
            }
            if (v19)
            {
              if (v19 >= [v13 count]) {
                [v13 lastObject];
              }
              else {
              v31 = [v13 objectAtIndex:v19];
              }
              [v31 doubleValue];
              double v27 = v32 - v17;
            }
            if (v19 >= [v11 numberOfEvents])
            {
              long long v33 = [v36 _fingerIdentifierForFingerAtIndex:i];
              objc_msgSend(v11, "_addPoint:force:forFingerIdentifier:atTime:", v33, v24, v26, v28, v27);
            }
            else
            {
              long long v33 = [v36 _fingerIdentifierForFingerAtIndex:i];
              objc_msgSend(v11, "_addPoint:force:forFingerIdentifier:atEventIndex:", v33, v19, v24, v26, v28);
            }
          }
        }
        uint64_t v18 = v43;
      }
      ++v19;
    }
    while ((uint64_t)v19 < v18[3]);
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v11;
}

unint64_t __59__AXNamedReplayableGesture_gestureWithPoints_times_forces___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t result = [a2 count];
  if (v5 <= result) {
    unint64_t v7 = result;
  }
  else {
    unint64_t v7 = v5;
  }
  if (v7 != *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
  }
  return result;
}

- (NSString)name
{
  return *(NSString **)&self->_hasLocalizableName;
}

- (void)setName:(id)a3
{
}

- (BOOL)hasLocalizableName
{
  return *(&self->super.super._arePointsDeviceRelative + 1);
}

- (void)setHasLocalizableName:(BOOL)a3
{
  *(&self->super.super._arePointsDeviceRelative + 1) = a3;
}

- (BOOL)shouldPerformAtOriginalLocation
{
  return *(&self->super.super._arePointsDeviceRelative + 2);
}

- (void)setShouldPerformAtOriginalLocation:(BOOL)a3
{
  *(&self->super.super._arePointsDeviceRelative + 2) = a3;
}

- (void).cxx_destruct
{
}

@end