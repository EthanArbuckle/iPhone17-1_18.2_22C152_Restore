@interface HMBLocalZoneQueryResultColumnTuple
- (HMBLocalZoneQueryResultColumnTuple)initWithName:(id)a3 offset:(int)a4 modelField:(id)a5;
- (HMBModelField)modelField;
- (NSString)name;
- (id)description;
- (int)offset;
@end

@implementation HMBLocalZoneQueryResultColumnTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelField, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (HMBModelField)modelField
{
  return self->_modelField;
}

- (int)offset
{
  return self->_offset;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMBLocalZoneQueryResultColumnTuple *)self name];
  uint64_t v5 = [(HMBLocalZoneQueryResultColumnTuple *)self offset];
  v6 = [(HMBLocalZoneQueryResultColumnTuple *)self modelField];
  v7 = [v3 stringWithFormat:@"<HMBQueryEncoder: %@ / %lu %@>", v4, v5, v6];

  return v7;
}

- (HMBLocalZoneQueryResultColumnTuple)initWithName:(id)a3 offset:(int)a4 modelField:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMBLocalZoneQueryResultColumnTuple;
  v11 = [(HMBLocalZoneQueryResultColumnTuple *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_offset = a4;
    objc_storeStrong((id *)&v12->_modelField, a5);
  }

  return v12;
}

@end