@interface _GCHapticTokenAndParams
- (NSMutableArray)params;
- (_GCHapticTokenAndParams)initWithHapticCommand:(const void *)a3;
- (unint64_t)token;
- (void)setParams:(id)a3;
@end

@implementation _GCHapticTokenAndParams

- (_GCHapticTokenAndParams)initWithHapticCommand:(const void *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_GCHapticTokenAndParams;
  v4 = [(_GCHapticTokenAndParams *)&v21 init];
  if (v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    params = v4->_params;
    v4->_params = (NSMutableArray *)v5;

    v4->_token = *((void *)a3 + 4);
    long long v7 = *(_OWORD *)((char *)a3 + 56);
    v19[0] = *(_OWORD *)((char *)a3 + 40);
    v19[1] = v7;
    long long v8 = *(_OWORD *)((char *)a3 + 88);
    v19[2] = *(_OWORD *)((char *)a3 + 72);
    v19[3] = v8;
    int v20 = *((_DWORD *)a3 + 26);
    v9 = (char *)v19 + 4;
    if (!LODWORD(v19[0])) {
      v9 = 0;
    }
    uint64_t v10 = LODWORD(v19[0]) >= 8 ? 8 : LODWORD(v19[0]);
    if (v10)
    {
      v11 = v9 + 4;
      do
      {
        int v12 = *(v11 - 1);
        uint64_t v13 = 330;
        if (v12 <= 1999)
        {
          switch(v12)
          {
            case 1000:
              goto LABEL_23;
            case 1001:
              goto LABEL_19;
            case 1010:
              goto LABEL_20;
            case 1011:
              goto LABEL_21;
            case 1012:
              goto LABEL_16;
            case 1013:
              uint64_t v13 = 336;
              goto LABEL_23;
            case 1015:
              uint64_t v13 = 332;
              goto LABEL_23;
            default:
              goto LABEL_24;
          }
          goto LABEL_24;
        }
        if (v12 <= 2009)
        {
          if (v12 == 2000) {
            goto LABEL_23;
          }
          if (v12 == 2001)
          {
LABEL_19:
            uint64_t v13 = 331;
            goto LABEL_23;
          }
        }
        else
        {
          switch(v12)
          {
            case 2010:
LABEL_20:
              uint64_t v13 = 333;
              goto LABEL_23;
            case 2011:
LABEL_21:
              uint64_t v13 = 334;
              goto LABEL_23;
            case 2012:
LABEL_16:
              uint64_t v13 = 335;
LABEL_23:
              v14 = v4->_params;
              v15 = [FixedParameter alloc];
              LODWORD(v16) = *v11;
              v17 = [(FixedParameter *)v15 initWithIdentifier:v13 value:v16];
              [(NSMutableArray *)v14 addObject:v17];

              break;
          }
        }
LABEL_24:
        v11 += 2;
        --v10;
      }
      while (v10);
    }
  }
  return v4;
}

- (NSMutableArray)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
}

- (unint64_t)token
{
  return self->_token;
}

- (void).cxx_destruct
{
}

@end