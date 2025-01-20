@interface _XREngineeringTypeBitRangeParser
+ (id)_elementNameToClassMap;
- (NSString)type;
- (int64_t)end;
- (int64_t)start;
- (void)_handleCompletion;
- (void)setEnd:(int64_t)a3;
- (void)setStart:(int64_t)a3;
- (void)setType:(id)a3;
@end

@implementation _XREngineeringTypeBitRangeParser

+ (id)_elementNameToClassMap
{
  if (qword_2687AA228 != -1) {
    dispatch_once(&qword_2687AA228, &unk_26E752830);
  }
  v2 = (void *)qword_2687AA220;

  return v2;
}

- (void)_handleCompletion
{
  id v32 = (id)objc_opt_new();
  v7 = [self v3:v4 v5:v6];
  [v32 setType:v8 withValue:v7 forKey:v9];

  unint64_t v15 = [self v11:v12 v13:v14];
  unint64_t v20 = [self v16:v17 v18:v18 v19:v19];
  if (v15 <= v20) {
    unint64_t v23 = v20;
  }
  else {
    unint64_t v23 = v15;
  }
  if (v15 >= v20) {
    [v32 setBitRange:v21 to:v22 from:v20 + v23];
  }
  else {
    [v32 setBitRange:v21 to:v23];
  }
  v28 = [self->super.parent method:v24 with:v25 with:v26 with:v27];
  [v28 addEntry:v29 withIdentifier:(uint64_t)v32 withOptions:v30 withCompletion:v31];
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (int64_t)start
{
  return self->_start;
}

- (void)setStart:(int64_t)a3
{
  self->_start = a3;
}

- (int64_t)end
{
  return self->_end;
}

- (void)setEnd:(int64_t)a3
{
  self->_end = a3;
}

- (void).cxx_destruct
{
}

@end