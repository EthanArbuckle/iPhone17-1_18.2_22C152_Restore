@interface GCGenericDevicePhysicalInputButtonModelBuilder
+ (Class)modelClass;
- (GCGenericDevicePhysicalInputButtonModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (id)build;
- (int64_t)sourceExtendedEventFieldIndex;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setSourceExtendedEventFieldIndex:(int64_t)a3;
@end

@implementation GCGenericDevicePhysicalInputButtonModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCGenericDevicePhysicalInputButtonModelBuilder;
  id v4 = a3;
  [(GCGenericDevicePhysicalInputElementModelBuilder *)&v6 initializeWithModel:v4];
  uint64_t v5 = objc_msgSend(v4, "sourceExtendedEventFieldIndex", v6.receiver, v6.super_class);

  [(GCGenericDevicePhysicalInputButtonModelBuilder *)self setSourceExtendedEventFieldIndex:v5];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDevicePhysicalInputButtonModelBuilder;
  [(GCGenericDevicePhysicalInputElementModelBuilder *)&v3 reset];
  [(GCGenericDevicePhysicalInputButtonModelBuilder *)self setSourceExtendedEventFieldIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (id)build
{
  v5.receiver = self;
  v5.super_class = (Class)GCGenericDevicePhysicalInputButtonModelBuilder;
  objc_super v3 = [(GCGenericDevicePhysicalInputElementModelBuilder *)&v5 build];
  v3[6] = [(GCGenericDevicePhysicalInputButtonModelBuilder *)self sourceExtendedEventFieldIndex];

  return v3;
}

- (int64_t)sourceExtendedEventFieldIndex
{
  return self->_sourceExtendedEventFieldIndex;
}

- (void)setSourceExtendedEventFieldIndex:(int64_t)a3
{
  self->_sourceExtendedEventFieldIndex = a3;
}

- (GCGenericDevicePhysicalInputButtonModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GCGenericDevicePhysicalInputButtonModelBuilder;
  v7 = [(GCGenericDevicePhysicalInputElementModelBuilder *)&v18 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7)
  {
LABEL_14:
    v12 = 0;
    goto LABEL_10;
  }
  id v17 = 0;
  v8 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"PressedValueSource", objc_opt_class(), &v17);
  id v9 = v17;
  v10 = v9;
  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v9 == 0;
  }
  if (!v11)
  {
    if (a4)
    {
      v19[0] = NSLocalizedDescriptionKey;
      v14 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v20[0] = v14;
      v19[1] = NSLocalizedFailureReasonErrorKey;
      v15 = [v10 localizedFailureReason];
      v20[1] = v15;
      v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_14;
  }
  if (v8) {
    -[GCGenericDevicePhysicalInputButtonModelBuilder setSourceExtendedEventFieldIndex:](v7, "setSourceExtendedEventFieldIndex:", [v8 integerValue]);
  }

  v12 = v7;
LABEL_10:

  return v12;
}

@end