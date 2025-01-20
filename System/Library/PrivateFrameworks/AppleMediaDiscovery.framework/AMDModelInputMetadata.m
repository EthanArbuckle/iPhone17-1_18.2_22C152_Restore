@interface AMDModelInputMetadata
+ (int64_t)getDataTypeFromString:(id)a3;
- (AMDModelInputMetadata)initWithDictionary:(id)a3;
- (BOOL)isValid;
- (NSArray)shape;
- (NSNumber)hashOpModValue;
- (NSNumber)paddingValue;
- (NSNumber)size;
- (NSNumber)truncateOpMaxValue;
- (NSNumber)truncateOpMinValue;
- (NSString)postRemapOperation;
- (id)getHashOpModValue;
- (id)getPaddingValue;
- (id)getPostRemapOperationName;
- (id)getShape;
- (id)getSize;
- (id)getTruncateOpMaxValue;
- (id)getTruncateOpMinValue;
- (int64_t)dataType;
- (int64_t)getDataType;
- (void)setDataType:(int64_t)a3;
- (void)setHashOpModValue:(id)a3;
- (void)setPaddingValue:(id)a3;
- (void)setPostRemapOperation:(id)a3;
- (void)setShape:(id)a3;
- (void)setSize:(id)a3;
- (void)setTruncateOpMaxValue:(id)a3;
- (void)setTruncateOpMinValue:(id)a3;
@end

@implementation AMDModelInputMetadata

- (AMDModelInputMetadata)initWithDictionary:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v17;
  v17 = 0;
  v15.receiver = v3;
  v15.super_class = (Class)AMDModelInputMetadata;
  v17 = [(AMDModelInputMetadata *)&v15 init];
  objc_storeStrong((id *)&v17, v17);
  id v6 = (id)[location[0] objectForKey:@"data_type"];
  int64_t v4 = +[AMDModelInputMetadata getDataTypeFromString:](AMDModelInputMetadata, "getDataTypeFromString:");
  [(AMDModelInputMetadata *)v17 setDataType:v4];

  id v7 = (id)[location[0] objectForKey:@"shape"];
  -[AMDModelInputMetadata setShape:](v17, "setShape:");

  id v8 = (id)[location[0] objectForKey:@"size"];
  -[AMDModelInputMetadata setSize:](v17, "setSize:");

  id v9 = (id)[location[0] objectForKey:@"padding_value"];
  -[AMDModelInputMetadata setPaddingValue:](v17, "setPaddingValue:");

  id v10 = (id)[location[0] objectForKey:@"post_remap_operation"];
  -[AMDModelInputMetadata setPostRemapOperation:](v17, "setPostRemapOperation:");

  id v11 = (id)[location[0] objectForKey:@"hash_op_mod_value"];
  -[AMDModelInputMetadata setHashOpModValue:](v17, "setHashOpModValue:");

  id v12 = (id)[location[0] objectForKey:@"truncate_op_min_value"];
  -[AMDModelInputMetadata setTruncateOpMinValue:](v17, "setTruncateOpMinValue:");

  id v13 = (id)[location[0] objectForKey:@"truncate_op_max_value"];
  -[AMDModelInputMetadata setTruncateOpMaxValue:](v17, "setTruncateOpMaxValue:");

  v14 = v17;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v14;
}

- (BOOL)isValid
{
  char v7 = 0;
  char v5 = 0;
  BOOL v4 = 0;
  if ([(AMDModelInputMetadata *)self dataType])
  {
    id v8 = [(AMDModelInputMetadata *)self size];
    char v7 = 1;
    BOOL v3 = 1;
    if (!v8)
    {
      id v6 = [(AMDModelInputMetadata *)self shape];
      char v5 = 1;
      BOOL v3 = v6 != 0;
    }
    BOOL v4 = v3;
  }
  if (v5) {

  }
  if (v7) {
  return v4;
  }
}

- (int64_t)getDataType
{
  return [(AMDModelInputMetadata *)self dataType];
}

- (id)getShape
{
  return [(AMDModelInputMetadata *)self shape];
}

- (id)getSize
{
  return [(AMDModelInputMetadata *)self size];
}

- (id)getPaddingValue
{
  return [(AMDModelInputMetadata *)self paddingValue];
}

- (id)getPostRemapOperationName
{
  return [(AMDModelInputMetadata *)self postRemapOperation];
}

- (id)getHashOpModValue
{
  return [(AMDModelInputMetadata *)self hashOpModValue];
}

- (id)getTruncateOpMinValue
{
  return [(AMDModelInputMetadata *)self truncateOpMinValue];
}

- (id)getTruncateOpMaxValue
{
  return [(AMDModelInputMetadata *)self truncateOpMaxValue];
}

+ (int64_t)getDataTypeFromString:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if ([location[0] isEqualToString:@"int32"])
    {
      int64_t v5 = 131104;
    }
    else if ([location[0] isEqualToString:@"double"])
    {
      int64_t v5 = 65600;
    }
    else if ([location[0] isEqualToString:@"float32"])
    {
      int64_t v5 = 65568;
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }
  objc_storeStrong(location, 0);
  return v5;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int64_t)a3
{
  self->_dataType = a3;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (NSNumber)paddingValue
{
  return self->_paddingValue;
}

- (void)setPaddingValue:(id)a3
{
}

- (NSString)postRemapOperation
{
  return self->_postRemapOperation;
}

- (void)setPostRemapOperation:(id)a3
{
}

- (NSNumber)hashOpModValue
{
  return self->_hashOpModValue;
}

- (void)setHashOpModValue:(id)a3
{
}

- (NSNumber)truncateOpMinValue
{
  return self->_truncateOpMinValue;
}

- (void)setTruncateOpMinValue:(id)a3
{
}

- (NSNumber)truncateOpMaxValue
{
  return self->_truncateOpMaxValue;
}

- (void)setTruncateOpMaxValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end