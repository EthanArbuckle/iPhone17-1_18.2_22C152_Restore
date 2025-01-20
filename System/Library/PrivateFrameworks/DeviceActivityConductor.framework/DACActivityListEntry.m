@interface DACActivityListEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (DACActivityListEntry)initWithCoder:(id)a3;
- (id)_initWithActivity:(void *)a3 date:(void *)a4 reason:(void *)a5 origin:(void *)a6 changeMarker:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACActivityListEntry

- (id)_initWithActivity:(void *)a3 date:(void *)a4 reason:(void *)a5 origin:(void *)a6 changeMarker:
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)DACActivityListEntry;
    v16 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      a1[3] = a4;
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    v6 = self->_activity;
    v7 = self->_date;
    unint64_t reason = self->_reason;
    changeMarker = self->_changeMarker;
  }
  else
  {
    unint64_t reason = 0;
    v6 = 0;
    v7 = 0;
    changeMarker = 0;
  }
  v10 = [v3 stringWithFormat:@"<%@: %p, %@, date(%@) reason(%lu) cm(%@)>", v5, self, v6, v7, reason, changeMarker];

  return v10;
}

- (DACActivityListEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] < 1)
  {
    v11 = 0;
    v5 = self;
  }
  else
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activity"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    v8 = (void *)[v7 unsignedIntegerValue];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"origin"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changeMarker"];
    if (!v10)
    {
      v10 = +[DACChangeMarker missingMarker];
    }
    v11 = (DACActivityListEntry *)-[DACActivityListEntry _initWithActivity:date:reason:origin:changeMarker:]((id *)&self->super.isa, v5, v6, v8, v9, v10);
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [v8 encodeInteger:1 forKey:@"version"];
  if (self)
  {
    [v8 encodeObject:self->_activity forKey:@"activity"];
    date = self->_date;
  }
  else
  {
    [v8 encodeObject:0 forKey:@"activity"];
    date = 0;
  }
  [v8 encodeObject:date forKey:@"date"];
  if (self)
  {
    v5 = [NSNumber numberWithUnsignedInteger:self->_reason];
    [v8 encodeObject:v5 forKey:@"reason"];

    [v8 encodeObject:self->_origin forKey:@"origin"];
    changeMarker = self->_changeMarker;
  }
  else
  {
    v7 = [NSNumber numberWithUnsignedInteger:0];
    [v8 encodeObject:v7 forKey:@"reason"];

    [v8 encodeObject:0 forKey:@"origin"];
    changeMarker = 0;
  }
  [v8 encodeObject:changeMarker forKey:@"changeMarker"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [DACActivityListEntry alloc];
  if (self)
  {
    v5 = self->_activity;
    v6 = self->_date;
    unint64_t reason = (void *)self->_reason;
    id v8 = self->_origin;
    changeMarker = self->_changeMarker;
  }
  else
  {
    id v8 = 0;
    v6 = 0;
    v5 = 0;
    unint64_t reason = 0;
    changeMarker = 0;
  }
  v10 = -[DACActivityListEntry _initWithActivity:date:reason:origin:changeMarker:]((id *)&v4->super.isa, v5, v6, reason, v8, changeMarker);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (DACActivityListEntry *)a3;
  v7 = v6;
  if (v6)
  {
    if (self == v6)
    {
      LOBYTE(self) = 1;
      goto LABEL_27;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      if (!self)
      {
LABEL_26:

        goto LABEL_27;
      }
      v9 = self->_activity;
      id v10 = v8[1];
      if (![(DACActivityDescriptor *)v9 isEqual:v10])
      {
        LOBYTE(self) = 0;
LABEL_25:

        goto LABEL_26;
      }
      v11 = self->_date;
      id v12 = v8[2];
      if (![(NSDate *)v11 isEqual:v12] || self->_reason != v8[3])
      {
        LOBYTE(self) = 0;
LABEL_24:

        goto LABEL_25;
      }
      id v13 = self->_origin;
      if (v13 || (id v16 = v8[4]) != 0)
      {
        id v4 = self->_origin;
        id v3 = v8[4];
        if (![(DACActivityDescriptor *)v4 isEqual:v3])
        {

          LOBYTE(self) = 0;
          if (v13)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        v17 = v13;
        int v18 = 1;
      }
      else
      {
        id v16 = 0;
        v17 = 0;
        int v18 = 0;
      }
      id v14 = self->_changeMarker;
      LOBYTE(self) = [(DACChangeMarker *)v14 isEqual:v8[5]];

      if (v18)
      {
      }
      id v13 = v17;
      if (v17) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  LOBYTE(self) = 0;
LABEL_27:

  return (char)self;
}

- (unint64_t)hash
{
  if (self) {
    activity = self->_activity;
  }
  else {
    activity = 0;
  }
  id v4 = activity;
  uint64_t v5 = [(DACActivityDescriptor *)v4 hash];
  if (self) {
    date = self->_date;
  }
  else {
    date = 0;
  }
  unint64_t v7 = [(NSDate *)date hash] ^ v5;

  return v7;
}

uint64_t __34__DACActivityListEntry_comparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = +[DACActivityDescriptor comparator];
  unint64_t v7 = (void *)v6;
  if (v4)
  {
    id v8 = (void *)v4[1];
    if (v5)
    {
LABEL_3:
      uint64_t v9 = v5[1];
      goto LABEL_4;
    }
  }
  else
  {
    id v8 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
LABEL_4:
  id v10 = *(uint64_t (**)(void *, id, uint64_t))(v6 + 16);
  id v11 = v8;
  uint64_t v12 = v10(v7, v11, v9);

  if (v12) {
    goto LABEL_9;
  }
  if (!v5)
  {
    id v13 = 0;
    if (v4) {
      goto LABEL_7;
    }
LABEL_15:
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  id v13 = (void *)v5[2];
  if (!v4) {
    goto LABEL_15;
  }
LABEL_7:
  uint64_t v14 = v4[2];
LABEL_8:
  id v15 = v13;
  uint64_t v12 = [v15 compare:v14];

LABEL_9:
  id v16 = DACLogForCategory(1);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134218498;
    uint64_t v19 = v12;
    __int16 v20 = 2114;
    v21 = v4;
    __int16 v22 = 2114;
    v23 = v5;
    _os_log_debug_impl(&dword_2330F4000, v16, OS_LOG_TYPE_DEBUG, "Compare yielded %ld for %{public}@ and %{public}@", (uint8_t *)&v18, 0x20u);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeMarker, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

@end