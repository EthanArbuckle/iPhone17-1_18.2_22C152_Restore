@interface GCGenericDevicePhysicalInputDpadModelBuilder
+ (Class)modelClass;
- (GCGenericDevicePhysicalInputDpadModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (id)build;
- (int64_t)sourceDownExtendedEventFieldIndex;
- (int64_t)sourceLeftExtendedEventFieldIndex;
- (int64_t)sourceRightExtendedEventFieldIndex;
- (int64_t)sourceUpExtendedEventFieldIndex;
- (void)initializeWithModel:(id)a3;
- (void)reset;
- (void)setSourceDownExtendedEventFieldIndex:(int64_t)a3;
- (void)setSourceLeftExtendedEventFieldIndex:(int64_t)a3;
- (void)setSourceRightExtendedEventFieldIndex:(int64_t)a3;
- (void)setSourceUpExtendedEventFieldIndex:(int64_t)a3;
@end

@implementation GCGenericDevicePhysicalInputDpadModelBuilder

+ (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)initializeWithModel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCGenericDevicePhysicalInputDpadModelBuilder;
  id v4 = a3;
  [(GCGenericDevicePhysicalInputElementModelBuilder *)&v6 initializeWithModel:v4];
  -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceUpExtendedEventFieldIndex:](self, "setSourceUpExtendedEventFieldIndex:", objc_msgSend(v4, "sourceUpExtendedEventFieldIndex", v6.receiver, v6.super_class));
  -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceDownExtendedEventFieldIndex:](self, "setSourceDownExtendedEventFieldIndex:", [v4 sourceDownExtendedEventFieldIndex]);
  -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceLeftExtendedEventFieldIndex:](self, "setSourceLeftExtendedEventFieldIndex:", [v4 sourceLeftExtendedEventFieldIndex]);
  uint64_t v5 = [v4 sourceRightExtendedEventFieldIndex];

  [(GCGenericDevicePhysicalInputDpadModelBuilder *)self setSourceRightExtendedEventFieldIndex:v5];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)GCGenericDevicePhysicalInputDpadModelBuilder;
  [(GCGenericDevicePhysicalInputElementModelBuilder *)&v3 reset];
  [(GCGenericDevicePhysicalInputDpadModelBuilder *)self setSourceUpExtendedEventFieldIndex:0x7FFFFFFFFFFFFFFFLL];
  [(GCGenericDevicePhysicalInputDpadModelBuilder *)self setSourceDownExtendedEventFieldIndex:0x7FFFFFFFFFFFFFFFLL];
  [(GCGenericDevicePhysicalInputDpadModelBuilder *)self setSourceLeftExtendedEventFieldIndex:0x7FFFFFFFFFFFFFFFLL];
  [(GCGenericDevicePhysicalInputDpadModelBuilder *)self setSourceRightExtendedEventFieldIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (id)build
{
  v5.receiver = self;
  v5.super_class = (Class)GCGenericDevicePhysicalInputDpadModelBuilder;
  objc_super v3 = [(GCGenericDevicePhysicalInputElementModelBuilder *)&v5 build];
  v3[6] = [(GCGenericDevicePhysicalInputDpadModelBuilder *)self sourceUpExtendedEventFieldIndex];
  v3[7] = [(GCGenericDevicePhysicalInputDpadModelBuilder *)self sourceDownExtendedEventFieldIndex];
  v3[8] = [(GCGenericDevicePhysicalInputDpadModelBuilder *)self sourceLeftExtendedEventFieldIndex];
  v3[9] = [(GCGenericDevicePhysicalInputDpadModelBuilder *)self sourceRightExtendedEventFieldIndex];

  return v3;
}

- (int64_t)sourceUpExtendedEventFieldIndex
{
  return self->_sourceUpExtendedEventFieldIndex;
}

- (void)setSourceUpExtendedEventFieldIndex:(int64_t)a3
{
  self->_sourceUpExtendedEventFieldIndex = a3;
}

- (int64_t)sourceDownExtendedEventFieldIndex
{
  return self->_sourceDownExtendedEventFieldIndex;
}

- (void)setSourceDownExtendedEventFieldIndex:(int64_t)a3
{
  self->_sourceDownExtendedEventFieldIndex = a3;
}

- (int64_t)sourceLeftExtendedEventFieldIndex
{
  return self->_sourceLeftExtendedEventFieldIndex;
}

- (void)setSourceLeftExtendedEventFieldIndex:(int64_t)a3
{
  self->_sourceLeftExtendedEventFieldIndex = a3;
}

- (int64_t)sourceRightExtendedEventFieldIndex
{
  return self->_sourceRightExtendedEventFieldIndex;
}

- (void)setSourceRightExtendedEventFieldIndex:(int64_t)a3
{
  self->_sourceRightExtendedEventFieldIndex = a3;
}

- (GCGenericDevicePhysicalInputDpadModelBuilder)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)GCGenericDevicePhysicalInputDpadModelBuilder;
  v7 = [(GCGenericDevicePhysicalInputElementModelBuilder *)&v29 initWithDictionaryRepresentation:v6 error:a4];
  if (!v7) {
    goto LABEL_33;
  }
  id v28 = 0;
  v8 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"UpValueSource", objc_opt_class(), &v28);
  id v9 = v28;
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
      v36[0] = NSLocalizedDescriptionKey;
      v20 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v37[0] = v20;
      v36[1] = NSLocalizedFailureReasonErrorKey;
      v21 = [v10 localizedFailureReason];
      v37[1] = v21;
      v22 = v37;
      v23 = v36;
LABEL_31:
      v24 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v24);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (v8) {
    -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceUpExtendedEventFieldIndex:](v7, "setSourceUpExtendedEventFieldIndex:", [v8 integerValue]);
  }

  id v27 = 0;
  v12 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"DownValueSource", objc_opt_class(), &v27);
  id v13 = v27;
  v10 = v13;
  if (!v12 && v13)
  {
    if (a4)
    {
      v34[0] = NSLocalizedDescriptionKey;
      v20 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v35[0] = v20;
      v34[1] = NSLocalizedFailureReasonErrorKey;
      v21 = [v10 localizedFailureReason];
      v35[1] = v21;
      v22 = v35;
      v23 = v34;
      goto LABEL_31;
    }
LABEL_32:

LABEL_33:
    v18 = 0;
    goto LABEL_22;
  }
  if (v12) {
    -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceDownExtendedEventFieldIndex:](v7, "setSourceDownExtendedEventFieldIndex:", [v12 integerValue]);
  }

  id v26 = 0;
  v14 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"LeftValueSource", objc_opt_class(), &v26);
  id v15 = v26;
  v10 = v15;
  if (!v14 && v15)
  {
    if (a4)
    {
      v32[0] = NSLocalizedDescriptionKey;
      v20 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v33[0] = v20;
      v32[1] = NSLocalizedFailureReasonErrorKey;
      v21 = [v10 localizedFailureReason];
      v33[1] = v21;
      v22 = v33;
      v23 = v32;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (v14) {
    -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceLeftExtendedEventFieldIndex:](v7, "setSourceLeftExtendedEventFieldIndex:", [v14 integerValue]);
  }

  id v25 = 0;
  v16 = objc_msgSend(v6, "gc_objectForKey:ofClass:error:", @"RightValueSource", objc_opt_class(), &v25);
  id v17 = v25;
  v10 = v17;
  if (!v16 && v17)
  {
    if (a4)
    {
      v30[0] = NSLocalizedDescriptionKey;
      v20 = +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", @"Invalid '%@' definition.", [(id)objc_opt_class() modelClass]);
      v31[0] = v20;
      v30[1] = NSLocalizedFailureReasonErrorKey;
      v21 = [v10 localizedFailureReason];
      v31[1] = v21;
      v22 = v31;
      v23 = v30;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (v16) {
    -[GCGenericDevicePhysicalInputDpadModelBuilder setSourceRightExtendedEventFieldIndex:](v7, "setSourceRightExtendedEventFieldIndex:", [v16 integerValue]);
  }

  v18 = v7;
LABEL_22:

  return v18;
}

@end