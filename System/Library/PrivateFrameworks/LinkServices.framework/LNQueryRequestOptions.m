@interface LNQueryRequestOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)convertArrayResultToAsyncSequence;
- (BOOL)isEqual:(id)a3;
- (LNExportedContentConfiguration)exportConfiguration;
- (LNQueryRequestOptions)init;
- (LNQueryRequestOptions)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConvertArrayResultToAsyncSequence:(BOOL)a3;
- (void)setExportConfiguration:(id)a3;
@end

@implementation LNQueryRequestOptions

- (void).cxx_destruct
{
}

- (void)setExportConfiguration:(id)a3
{
}

- (LNExportedContentConfiguration)exportConfiguration
{
  return self->_exportConfiguration;
}

- (void)setConvertArrayResultToAsyncSequence:(BOOL)a3
{
  self->_convertArrayResultToAsyncSequence = a3;
}

- (BOOL)convertArrayResultToAsyncSequence
{
  return self->_convertArrayResultToAsyncSequence;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNQueryRequestOptions *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v7 = [(LNQueryRequestOptions *)self convertArrayResultToAsyncSequence];
        if (v7 != [(LNQueryRequestOptions *)v6 convertArrayResultToAsyncSequence])
        {
          char v8 = 0;
LABEL_16:

          goto LABEL_17;
        }
        v10 = [(LNQueryRequestOptions *)self exportConfiguration];
        v11 = [(LNQueryRequestOptions *)v6 exportConfiguration];
        v9 = v10;
        v12 = v11;
        v13 = v12;
        if (v9 == v12)
        {
          char v8 = 1;
        }
        else
        {
          char v8 = 0;
          if (v9 && v12) {
            char v8 = [(LNQueryRequestOptions *)v9 isEqual:v12];
          }
        }
      }
      else
      {
        char v8 = 0;
        v9 = v6;
        v6 = 0;
      }
    }
    else
    {
      v9 = 0;
      char v8 = 0;
    }

    goto LABEL_16;
  }
  char v8 = 1;
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  return [(LNExportedContentConfiguration *)self->_exportConfiguration hash];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if ([(LNQueryRequestOptions *)self convertArrayResultToAsyncSequence]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  BOOL v7 = [(LNQueryRequestOptions *)self exportConfiguration];
  char v8 = [v3 stringWithFormat:@"<%@ convertArrayResultToAsyncSequence: %@, exportConfiguration: %@>", v5, v6, v7];

  return v8;
}

- (LNQueryRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"convertArrayResultToAsyncSequence"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exportConfiguration"];

  BOOL v7 = [(LNQueryRequestOptions *)self init];
  char v8 = v7;
  if (v7)
  {
    [(LNQueryRequestOptions *)v7 setConvertArrayResultToAsyncSequence:v5];
    [(LNQueryRequestOptions *)v8 setExportConfiguration:v6];
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[LNQueryRequestOptions convertArrayResultToAsyncSequence](self, "convertArrayResultToAsyncSequence"), @"convertArrayResultToAsyncSequence");
  id v5 = [(LNQueryRequestOptions *)self exportConfiguration];
  [v4 encodeObject:v5 forKey:@"exportConfiguration"];
}

- (LNQueryRequestOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)LNQueryRequestOptions;
  v2 = [(LNQueryRequestOptions *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_convertArrayResultToAsyncSequence = 0;
    id v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end