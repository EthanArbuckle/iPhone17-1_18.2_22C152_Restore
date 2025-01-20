@interface GCGenericDeviceElementModel
+ (BOOL)supportsSecureCoding;
+ (id)description;
+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)optional;
- (GCGenericDeviceElementModel)init;
- (GCGenericDeviceElementModel)initWithCoder:(id)a3;
- (NSPredicate)predicate;
- (NSString)identifier;
- (id)debugDescription;
- (int)typeOverride;
- (int64_t)calibrationMax;
- (int64_t)calibrationMin;
- (unint64_t)hash;
- (unsigned)elementCookie;
- (void)encodeWithCoder:(id)a3;
- (void)setElementCookie:(unsigned int)a3;
@end

@implementation GCGenericDeviceElementModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCGenericDeviceElementModel)init
{
  return 0;
}

- (GCGenericDeviceElementModel)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GCGenericDeviceElementModel;
  id v3 = a3;
  v4 = [(GCGenericDeviceElementModel *)&v11 init];
  v4->_elementCookie = objc_msgSend(v3, "decodeIntForKey:", @"elementCookie", v11.receiver, v11.super_class);
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
  predicate = v4->_predicate;
  v4->_predicate = (NSPredicate *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v7;

  v4->_optional = [v3 decodeBoolForKey:@"optional"];
  v4->_typeOverride = [v3 decodeIntForKey:@"typeOverride"];
  v4->_calibrationMin = [v3 decodeIntegerForKey:@"calibrationMin"];
  uint64_t v9 = [v3 decodeIntegerForKey:@"calibrationMax"];

  v4->_calibrationMax = v9;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInt:forKey:", -[GCGenericDeviceElementModel elementCookie](self, "elementCookie"), @"elementCookie");
  v4 = [(GCGenericDeviceElementModel *)self predicate];
  [v6 encodeObject:v4 forKey:@"predicate"];

  uint64_t v5 = [(GCGenericDeviceElementModel *)self identifier];
  [v6 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v6, "encodeBool:forKey:", -[GCGenericDeviceElementModel optional](self, "optional"), @"optional");
  objc_msgSend(v6, "encodeInt:forKey:", -[GCGenericDeviceElementModel typeOverride](self, "typeOverride"), @"typeOverride");
  objc_msgSend(v6, "encodeInteger:forKey:", -[GCGenericDeviceElementModel calibrationMin](self, "calibrationMin"), @"calibrationMin");
  objc_msgSend(v6, "encodeInteger:forKey:", -[GCGenericDeviceElementModel calibrationMax](self, "calibrationMax"), @"calibrationMax");
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([(GCGenericDeviceElementModel *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
LABEL_9:
      BOOL v8 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[GCGenericDeviceElementModel isMemberOfClass:](self, "isMemberOfClass:", [(id)objc_opt_class() modelClass]))
    {
      goto LABEL_9;
    }
  }
  if ([(GCGenericDeviceElementModel *)self elementCookie]
    && (uint64_t v6 = [(GCGenericDeviceElementModel *)self elementCookie],
        v6 == [v5 elementCookie]))
  {
    int v7 = 0;
  }
  else
  {
    uint64_t v6 = [(GCGenericDeviceElementModel *)self predicate];
    id v3 = [v5 predicate];
    if (![(id)v6 isEqual:v3])
    {
      BOOL v8 = 0;
LABEL_18:

      goto LABEL_19;
    }
    int v7 = 1;
  }
  uint64_t v9 = [(GCGenericDeviceElementModel *)self identifier];
  v10 = [v5 identifier];
  if ([v9 isEqual:v10]
    && (int v11 = [(GCGenericDeviceElementModel *)self optional],
        v11 == [v5 optional]))
  {
    int v12 = [(GCGenericDeviceElementModel *)self typeOverride];
    BOOL v8 = v12 == [v5 typeOverride];
  }
  else
  {
    BOOL v8 = 0;
  }

  if (v7) {
    goto LABEL_18;
  }
LABEL_19:

  return v8;
}

+ (id)description
{
  return @"Element";
}

- (id)debugDescription
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(GCGenericDeviceElementModel *)self identifier];
  uint64_t v6 = [(GCGenericDeviceElementModel *)self predicate];
  int v7 = +[NSString stringWithFormat:@"<%@ %p> {\n\t identifier = %@\n\t predicate = %@\n\t optional = %d\n\t type (override) = %i\n}", v4, self, v5, v6, [(GCGenericDeviceElementModel *)self optional], [(GCGenericDeviceElementModel *)self typeOverride]];

  return v7;
}

- (unsigned)elementCookie
{
  return self->_elementCookie;
}

- (void)setElementCookie:(unsigned int)a3
{
  self->_elementCookie = a3;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)optional
{
  return self->_optional;
}

- (int)typeOverride
{
  return self->_typeOverride;
}

- (int64_t)calibrationMin
{
  return self->_calibrationMin;
}

- (int64_t)calibrationMax
{
  return self->_calibrationMax;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (id)modelWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v6 = objc_opt_new();
  id v55 = 0;
  int v7 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"Predicate", objc_opt_class(), &v55);
  id v8 = v55;
  if (!v7)
  {
    if (a4)
    {
      v69[0] = NSLocalizedDescriptionKey;
      v25 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v70[0] = v25;
      v69[1] = NSLocalizedFailureReasonErrorKey;
      v26 = [v8 localizedFailureReason];
      v70[1] = v26;
      v27 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v27);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_46;
  }
  uint64_t v9 = +[NSPredicate predicateWithFormat:v7];
  if (!v9)
  {
    if (a4)
    {
      v67[0] = NSLocalizedDescriptionKey;
      v43 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v68[0] = v43;
      v67[1] = NSLocalizedFailureReasonErrorKey;
      v44 = +[NSString stringWithFormat:@"String is not a valid predicate: %@", v7];
      v68[1] = v44;
      v67[2] = NSUnderlyingErrorKey;
      v45 = v8;
      if (!v8)
      {
        v45 = +[NSNull null];
      }
      v68[2] = v45;
      v67[3] = @"GCFailingKeyPathErrorKey";
      v66 = @"Predicate";
      v46 = +[NSArray arrayWithObjects:&v66 count:1];
      v68[3] = v46;
      v47 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:4];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v47);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8) {
    }
      }

    goto LABEL_46;
  }
  [v6 setPredicate:v9];

  id v54 = 0;
  v10 = objc_msgSend(a3, "gc_requiredObjectForKey:ofClass:error:", @"Identifier", objc_opt_class(), &v54);
  id v11 = v54;
  if (!v10)
  {
    if (a4)
    {
      v64[0] = NSLocalizedDescriptionKey;
      v28 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v65[0] = v28;
      v64[1] = NSLocalizedFailureReasonErrorKey;
      v29 = [v11 localizedFailureReason];
      v65[1] = v29;
      v30 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v30);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_46;
  }
  [v6 setIdentifier:v10];

  id v53 = 0;
  int v12 = objc_msgSend(a3, "gc_objectForKey:ofClass:error:", @"Optional", objc_opt_class(), &v53);
  id v13 = v53;
  v14 = v13;
  if (!v12 && v13)
  {
    if (a4)
    {
      v62[0] = NSLocalizedDescriptionKey;
      v31 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v63[0] = v31;
      v62[1] = NSLocalizedFailureReasonErrorKey;
      v32 = [v14 localizedFailureReason];
      v63[1] = v32;
      v33 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v33);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_46;
  }
  if (v12) {
    objc_msgSend(v6, "setOptional:", objc_msgSend(v12, "BOOLValue"));
  }

  id v52 = 0;
  v15 = objc_msgSend(a3, "gc_objectForKey:ofClass:error:", @"TypeOverride", objc_opt_class(), &v52);
  id v16 = v52;
  v17 = v16;
  if (!v15 && v16)
  {
    if (a4)
    {
      v60[0] = NSLocalizedDescriptionKey;
      v34 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v61[0] = v34;
      v60[1] = NSLocalizedFailureReasonErrorKey;
      v35 = [v17 localizedFailureReason];
      v61[1] = v35;
      v36 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v36);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_46;
  }
  if (v15) {
    objc_msgSend(v6, "setTypeOverride:", objc_msgSend(v15, "intValue"));
  }

  id v51 = 0;
  v18 = objc_msgSend(a3, "gc_objectForKey:ofClass:error:", @"CalibrationMin", objc_opt_class(), &v51);
  id v19 = v51;
  v20 = v19;
  if (!v18 && v19)
  {
    if (a4)
    {
      v58[0] = NSLocalizedDescriptionKey;
      v37 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v59[0] = v37;
      v58[1] = NSLocalizedFailureReasonErrorKey;
      v38 = [v20 localizedFailureReason];
      v59[1] = v38;
      v39 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v39);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_46;
  }
  if (v18) {
    objc_msgSend(v6, "setCalibrationMin:", objc_msgSend(v18, "integerValue"));
  }

  id v50 = 0;
  v21 = objc_msgSend(a3, "gc_objectForKey:ofClass:error:", @"CalibrationMax", objc_opt_class(), &v50);
  id v22 = v50;
  v23 = v22;
  if (!v21 && v22)
  {
    if (a4)
    {
      v56[0] = NSLocalizedDescriptionKey;
      v40 = +[NSString stringWithFormat:@"Invalid '%@' definition.", a1];
      v57[0] = v40;
      v56[1] = NSLocalizedFailureReasonErrorKey;
      v41 = [v23 localizedFailureReason];
      v57[1] = v41;
      v42 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
      +[NSError gc_modelError:userInfo:]((uint64_t)&off_26BEEAB30, 1, (uint64_t)v42);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_46:
    v24 = 0;
    goto LABEL_47;
  }
  if (v21) {
    objc_msgSend(v6, "setCalibrationMax:", objc_msgSend(v21, "integerValue"));
  }

  v24 = [v6 build];
LABEL_47:

  return v24;
}

@end