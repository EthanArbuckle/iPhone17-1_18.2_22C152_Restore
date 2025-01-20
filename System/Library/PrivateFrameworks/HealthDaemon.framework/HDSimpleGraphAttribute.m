@interface HDSimpleGraphAttribute
- (HDSimpleGraphAttribute)init;
- (HDSimpleGraphAttribute)initWithRowID:(int64_t)a3 type:(int64_t)a4 value:(id)a5 nodeID:(int64_t)a6;
- (HDSimpleGraphAttribute)initWithRowID:(int64_t)a3 type:(int64_t)a4 value:(id)a5 nodeID:(int64_t)a6 version:(int64_t)a7 slots:(unint64_t)a8;
- (NSString)value;
- (id)description;
- (int64_t)nodeID;
- (int64_t)type;
@end

@implementation HDSimpleGraphAttribute

- (HDSimpleGraphAttribute)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDSimpleGraphAttribute)initWithRowID:(int64_t)a3 type:(int64_t)a4 value:(id)a5 nodeID:(int64_t)a6 version:(int64_t)a7 slots:(unint64_t)a8
{
  v14 = (__CFString *)a5;
  v15 = v14;
  if (v14 == @"hgNULL") {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = [(__CFString *)v14 isEqualToString:@"hgNULL"];
  }
  v22.receiver = self;
  v22.super_class = (Class)HDSimpleGraphAttribute;
  v17 = [(HDSimpleGraphObject *)&v22 initWithRowID:a3 version:a7 slots:a8 deleted:v16];
  v18 = v17;
  if (v17)
  {
    v17->_type = a4;
    uint64_t v19 = [(__CFString *)v15 copy];
    value = v18->_value;
    v18->_value = (NSString *)v19;

    v18->_nodeID = a6;
  }

  return v18;
}

- (HDSimpleGraphAttribute)initWithRowID:(int64_t)a3 type:(int64_t)a4 value:(id)a5 nodeID:(int64_t)a6
{
  return [(HDSimpleGraphAttribute *)self initWithRowID:a3 type:a4 value:a5 nodeID:a6 version:0 slots:0];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HDSimpleGraphAttribute;
  uint64_t v4 = [(HDSimpleGraphObject *)&v7 description];
  v5 = [v3 stringWithFormat:@"<%@ %lld->%lld = %@>", v4, self->_nodeID, self->_type, self->_value];

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (int64_t)nodeID
{
  return self->_nodeID;
}

- (void).cxx_destruct
{
}

@end