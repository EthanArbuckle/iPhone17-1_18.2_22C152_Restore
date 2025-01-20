@interface NEIKEv2ConfigurationMessage
- (NEIKEv2ConfigurationMessage)initWithWithAttributes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
@end

@implementation NEIKEv2ConfigurationMessage

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if (self)
  {
    unint64_t configurationType = self->_configurationType;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unint64_t configurationType = 0;
  if (v4) {
LABEL_3:
  }
    *(void *)(v4 + 8) = configurationType;
LABEL_4:
  id v8 = objc_alloc(MEMORY[0x1E4F1C978]);
  if (self) {
    id Property = objc_getProperty(self, v7, 16, 1);
  }
  else {
    id Property = 0;
  }
  v11 = (void *)[v8 initWithArray:Property copyItems:1];
  if (v5) {
    objc_setProperty_atomic(v5, v10, v11, 16);
  }

  return v5;
}

- (id)description
{
  return [(NEIKEv2ConfigurationMessage *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  id v8 = v7;
  if (self)
  {
    unint64_t v9 = self->_configurationType - 1;
    if (v9 < 4)
    {
      v10 = off_1E59904D8[v9];
      [v7 appendPrettyObject:v10 withName:@"Type" andIndent:v5 options:a4];
LABEL_6:
      id Property = objc_getProperty(self, v11, 16, 1);
      goto LABEL_7;
    }
    id v12 = [NSString alloc];
    unint64_t configurationType = self->_configurationType;
  }
  else
  {
    id v12 = [NSString alloc];
    unint64_t configurationType = 0;
  }
  v10 = (__CFString *)objc_msgSend(v12, "initWithFormat:", @"%u", configurationType);
  [v8 appendPrettyObject:v10 withName:@"Type" andIndent:v5 options:a4];
  if (self) {
    goto LABEL_6;
  }
  id Property = 0;
LABEL_7:
  [v8 appendPrettyObject:Property withName:@"Attributes" andIndent:v5 options:a4];

  return v8;
}

- (NEIKEv2ConfigurationMessage)initWithWithAttributes:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEIKEv2ConfigurationMessage;
  uint64_t v5 = [(NEIKEv2ConfigurationMessage *)&v12 init];
  v7 = v5;
  if (v5)
  {
    objc_setProperty_atomic(v5, v6, v4, 16);
    id v8 = v7;
  }
  else
  {
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_FAULT, "[super init] failed", v11, 2u);
    }
  }
  return v7;
}

@end