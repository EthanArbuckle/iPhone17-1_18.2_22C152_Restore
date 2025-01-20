@interface CBSpatialInteractionFilter
- (BOOL)isEqual:(id)a3;
- (CBSpatialInteractionFilter)initWithXPCObject:(id)a3 error:(id *)a4;
- (id)blob;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mask;
- (unsigned)requiredSpatialFlags;
- (void)encodeWithXPCObject:(id)a3;
- (void)setRequiredSpatialFlags:(unsigned __int8)a3;
@end

@implementation CBSpatialInteractionFilter

- (CBSpatialInteractionFilter)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CBSpatialInteractionFilter *)self init];
  if (!v7)
  {
    if (a4)
    {
      v17 = [(id)objc_opt_class() description];
      CBErrorF(-6756, (uint64_t)"%@ init failed", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v24);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 != 6)
  {
    if (v14 != 5) {
      goto LABEL_6;
    }
LABEL_12:
    v15 = 0;
    goto LABEL_7;
  }
  v7->_requiredSpatialFlags = 0;
LABEL_6:
  v15 = v7;
LABEL_7:

  return v15;
}

- (void)encodeWithXPCObject:(id)a3
{
  if (self->_requiredSpatialFlags) {
    xpc_dictionary_set_uint64(a3, "siFl", self->_requiredSpatialFlags);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4) {
    objc_msgSend(v4, "setRequiredSpatialFlags:", -[CBSpatialInteractionFilter requiredSpatialFlags](self, "requiredSpatialFlags"));
  }
  return v4;
}

- (id)description
{
  id v2 = [NSString alloc];
  v3 = CUPrintFlags32();
  v4 = (void *)[v2 initWithFormat:@"RequiredSF %@", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CBSpatialInteractionFilter *)a3;
  v5 = v4;
  if (!v4)
  {
LABEL_5:

    return 0;
  }
  if (v4 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v6 = [(CBSpatialInteractionFilter *)v5 requiredSpatialFlags];
      BOOL v7 = v6 == [(CBSpatialInteractionFilter *)self requiredSpatialFlags];

      return v7;
    }
    goto LABEL_5;
  }

  return 1;
}

- (id)blob
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v3 appendBytes:&self->_requiredSpatialFlags length:1];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)mask
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v3 appendBytes:&self->_requiredSpatialFlags length:1];
  v4 = (void *)[v3 copy];

  return v4;
}

- (unsigned)requiredSpatialFlags
{
  return self->_requiredSpatialFlags;
}

- (void)setRequiredSpatialFlags:(unsigned __int8)a3
{
  self->_requiredSpatialFlags = a3;
}

@end