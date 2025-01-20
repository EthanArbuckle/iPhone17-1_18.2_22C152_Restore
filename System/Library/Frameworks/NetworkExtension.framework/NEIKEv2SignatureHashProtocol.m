@interface NEIKEv2SignatureHashProtocol
- (BOOL)isEqual:(id)a3;
- (NEIKEv2SignatureHashProtocol)initWithHashType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hashType;
@end

@implementation NEIKEv2SignatureHashProtocol

- (unint64_t)hashType
{
  return self->_hashType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(NEIKEv2SignatureHashProtocol *)self hashType];

  return (id)[v4 initWithHashType:v5];
}

- (int64_t)compare:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[NEIKEv2SignatureHashProtocol hashType](self, "hashType"));
  v7 = NSNumber;
  uint64_t v8 = [v5 hashType];

  v9 = [v7 numberWithUnsignedInteger:v8];
  int64_t v10 = [v6 compare:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    unint64_t v6 = [(NEIKEv2SignatureHashProtocol *)self hashType];
    uint64_t v7 = [v5 hashType];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  String = NEIKEv2HashTypeCreateString([(NEIKEv2SignatureHashProtocol *)self hashType]);

  return String;
}

- (NEIKEv2SignatureHashProtocol)initWithHashType:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEIKEv2SignatureHashProtocol;
  id v4 = [(NEIKEv2SignatureHashProtocol *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    v4->_hashType = a3;
    unint64_t v6 = v4;
  }
  else
  {
    BOOL v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", v9, 2u);
    }
  }
  return v5;
}

@end