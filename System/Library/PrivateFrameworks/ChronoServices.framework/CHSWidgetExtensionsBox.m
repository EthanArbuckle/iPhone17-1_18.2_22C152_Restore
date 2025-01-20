@interface CHSWidgetExtensionsBox
+ (BOOL)supportsSecureCoding;
- (CHSWidgetExtensionProviderOptions)options;
- (CHSWidgetExtensionsBox)initWithCoder:(id)a3;
- (CHSWidgetExtensionsBox)initWithExtensions:(id)a3;
- (CHSWidgetExtensionsBox)initWithExtensions:(id)a3 generatedFrom:(id)a4;
- (NSSet)extensions;
- (unint64_t)sequenceNumber;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForEncoding;
- (void)setExtensions:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
@end

@implementation CHSWidgetExtensionsBox

- (CHSWidgetExtensionsBox)initWithExtensions:(id)a3
{
  return [(CHSWidgetExtensionsBox *)self initWithExtensions:a3 generatedFrom:0];
}

- (CHSWidgetExtensionsBox)initWithExtensions:(id)a3 generatedFrom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CHSWidgetExtensionsBox;
  v8 = [(CHSWidgetExtensionsBox *)&v10 init];
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sequenceLock);
    ++lock_sequenceNumber;
    -[CHSWidgetExtensionsBox setSequenceNumber:](v8, "setSequenceNumber:");
    os_unfair_lock_unlock((os_unfair_lock_t)&sequenceLock);
    [(CHSWidgetExtensionsBox *)v8 setOptions:v7];
    [(CHSWidgetExtensionsBox *)v8 setExtensions:v6];
  }

  return v8;
}

- (void)prepareForEncoding
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_190C6F000, log, OS_LOG_TYPE_ERROR, "Error encoding %@: %{public}@", buf, 0x16u);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSWidgetExtensionsBox)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CHSWidgetExtensionsBox;
  v5 = [(CHSWidgetExtensionsBox *)&v17 init];
  id v6 = v5;
  if (v5)
  {
    v5->_sequenceNumber = [v4 decodeIntegerForKey:@"sequence"];
    if ([v4 containsValueForKey:@"options"])
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
      options = v5->_options;
      v5->_options = (CHSWidgetExtensionProviderOptions *)v7;
    }
    if ([v4 containsValueForKey:@"data"])
    {
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
      id v16 = 0;
      p_isa = [MEMORY[0x1E4F960F8] decodeObjectOfClass:objc_opt_class() fromData:v9 error:&v16];
      id v11 = v16;
      if (v11)
      {
        [v4 failWithError:v11];
      }
      else if (p_isa)
      {
        objc_storeStrong((id *)&v5->_extensions, p_isa[2]);
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v13 = objc_opt_class();
      objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v9 = [v4 decodeObjectOfClasses:v11 forKey:@"extensions"];
      if (!v9)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
      p_isa = (id *)&v6->_extensions->super.isa;
      v6->_extensions = (NSSet *)v14;
    }

    goto LABEL_12;
  }
LABEL_13:

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  archivedData = self->_archivedData;
  id v8 = v4;
  if (archivedData)
  {
    [v4 encodeObject:archivedData forKey:@"data"];
  }
  else
  {
    id v6 = [(NSSet *)self->_extensions allObjects];
    [v8 encodeObject:v6 forKey:@"extensions"];
  }
  [v8 encodeInteger:self->_sequenceNumber forKey:@"sequence"];
  options = self->_options;
  if (options) {
    [v8 encodeObject:options forKey:@"options"];
  }
}

- (NSSet)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (CHSWidgetExtensionProviderOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_archivedData, 0);
}

@end