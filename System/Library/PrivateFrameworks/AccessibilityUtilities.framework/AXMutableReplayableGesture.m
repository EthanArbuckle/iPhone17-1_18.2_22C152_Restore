@interface AXMutableReplayableGesture
- (id)_forcesByFingerIdentifierAtEventIndex:(unint64_t)a3;
- (id)_pointsByFingerIdentifierAtEventIndex:(unint64_t)a3;
- (void)_addPoint:(CGPoint)a3 force:(double)a4 forFingerIdentifier:(id)a5 atEventIndex:(unint64_t)a6;
- (void)_addPoint:(CGPoint)a3 force:(double)a4 forFingerIdentifier:(id)a5 atTime:(double)a6;
- (void)_removeFingersAtEventIndex:(unint64_t)a3;
- (void)addPointsByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5;
- (void)addPointsFromReplayableGesture:(id)a3;
@end

@implementation AXMutableReplayableGesture

- (void)addPointsByFingerIdentifier:(id)a3 forces:(id)a4 atTime:(double)a5
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v11) {
    _AXAssert();
  }
  if (!self->super._allEvents)
  {
    v16 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    allEvents = self->super._allEvents;
    self->super._allEvents = v16;

    if (!v12) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v12)
  {
LABEL_12:
    v13 = self->super._allEvents;
    v18[0] = @"Time";
    v14 = [NSNumber numberWithDouble:a5];
    v19[0] = v14;
    v19[1] = v8;
    v18[1] = @"Fingers";
    v18[2] = @"Forces";
    v19[2] = v10;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
    [(NSArray *)v13 addObject:v15];
  }
LABEL_13:
}

- (void)addPointsFromReplayableGesture:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (v4)
  {
    allEvents = self->super._allEvents;
    id v9 = v5;
    if (allEvents)
    {
      v4 = (id *)[(NSArray *)allEvents addObjectsFromArray:v5[1]];
    }
    else
    {
      v7 = (NSArray *)[v5[1] mutableCopy];
      id v8 = self->super._allEvents;
      self->super._allEvents = v7;
    }
    v5 = v9;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_addPoint:(CGPoint)a3 force:(double)a4 forFingerIdentifier:(id)a5 atTime:(double)a6
{
  double y = a3.y;
  double x = a3.x;
  v26[3] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  allEvents = self->super._allEvents;
  if (!allEvents)
  {
    v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14 = self->super._allEvents;
    self->super._allEvents = v13;

    allEvents = self->super._allEvents;
  }
  v25[0] = @"Time";
  v15 = [NSNumber numberWithDouble:a6];
  v26[0] = v15;
  v25[1] = @"Fingers";
  id v23 = v11;
  v16 = objc_msgSend(MEMORY[0x1E4F29238], "axValueWithCGPoint:", x, y);
  v24 = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v26[1] = v17;
  v25[2] = @"Forces";
  id v21 = v11;
  v18 = [NSNumber numberWithDouble:a4];
  v22 = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v26[2] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  [(NSArray *)allEvents addObject:v20];
}

- (void)_addPoint:(CGPoint)a3 force:(double)a4 forFingerIdentifier:(id)a5 atEventIndex:(unint64_t)a6
{
  double y = a3.y;
  double x = a3.x;
  v23[3] = *MEMORY[0x1E4F143B8];
  allEvents = self->super._allEvents;
  id v12 = a5;
  v13 = [(NSArray *)allEvents objectAtIndexedSubscript:a6];
  v14 = [v13 objectForKeyedSubscript:@"Fingers"];
  v15 = (void *)[v14 mutableCopy];

  v16 = objc_msgSend(MEMORY[0x1E4F29238], "axValueWithCGPoint:", x, y);
  [v15 setObject:v16 forKeyedSubscript:v12];

  v17 = [v13 objectForKeyedSubscript:@"Forces"];
  v18 = (void *)[v17 mutableCopy];

  v19 = [NSNumber numberWithDouble:a4];
  [v18 setObject:v19 forKeyedSubscript:v12];

  v22[0] = @"Fingers";
  v22[1] = @"Forces";
  v23[0] = v15;
  v23[1] = v18;
  v22[2] = @"Time";
  v20 = objc_msgSend(v13, "objectForKeyedSubscript:");
  v23[2] = v20;
  id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  [(NSArray *)self->super._allEvents setObject:v21 atIndexedSubscript:a6];
}

- (void)_removeFingersAtEventIndex:(unint64_t)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v5 = -[NSArray objectAtIndexedSubscript:](self->super._allEvents, "objectAtIndexedSubscript:");
  v8[0] = @"Fingers";
  v8[1] = @"Forces";
  v9[0] = MEMORY[0x1E4F1CC08];
  v9[1] = MEMORY[0x1E4F1CC08];
  v8[2] = @"Time";
  v6 = objc_msgSend(v5, "objectForKeyedSubscript:");
  v9[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  [(NSArray *)self->super._allEvents setObject:v7 atIndexedSubscript:a3];
}

- (id)_pointsByFingerIdentifierAtEventIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->super._allEvents objectAtIndexedSubscript:a3];
  v4 = [v3 objectForKeyedSubscript:@"Fingers"];

  return v4;
}

- (id)_forcesByFingerIdentifierAtEventIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->super._allEvents objectAtIndexedSubscript:a3];
  v4 = [v3 objectForKeyedSubscript:@"Forces"];

  return v4;
}

@end