@interface HDStringParameter
- (BOOL)required;
- (BOOL)validateValue:(id)a3 error:(id *)a4;
- (HDStringParameter)init;
- (HDStringParameter)initWithSummary:(id)a3 required:(BOOL)a4;
- (NSString)summary;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setRequired:(BOOL)a3;
- (void)setSummary:(id)a3;
@end

@implementation HDStringParameter

- (HDStringParameter)init
{
  return [(HDStringParameter *)self initWithSummary:&stru_26EAEABB8 required:1];
}

- (HDStringParameter)initWithSummary:(id)a3 required:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDStringParameter;
  v8 = [(HDStringParameter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_summary, a3);
    v9->_required = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(HDStringParameter *)self summary];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setSummary:v7];

  objc_msgSend(v5, "setRequired:", -[HDStringParameter required](self, "required"));
  return v5;
}

- (BOOL)validateValue:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v7 = isKindOfClass;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    v8 = NSString;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    objc_super v11 = [v8 stringWithFormat:@"Expected String value, not %@.", v10];

    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = v11;
    v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v14 = [v12 errorWithDomain:@"com.apple.osdiags.hardware-diagnostics.ErrorDomain" code:4 userInfo:v13];

    id v15 = v14;
    *a4 = v15;
  }
  return v7 & 1;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (BOOL)required
{
  return self->_required;
}

- (void)setRequired:(BOOL)a3
{
  self->_required = a3;
}

- (void).cxx_destruct
{
}

@end