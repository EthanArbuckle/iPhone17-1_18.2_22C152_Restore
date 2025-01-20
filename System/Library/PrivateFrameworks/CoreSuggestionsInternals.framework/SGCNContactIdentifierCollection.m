@interface SGCNContactIdentifierCollection
- (BOOL)_optimizeAndAddCNContactIdentifier:(id)a3;
- (SGCNContactIdentifierCollection)init;
- (id)proxyArray;
- (void)addCNContactIdentifier:(id)a3;
@end

@implementation SGCNContactIdentifierCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unoptimizedIdentifiers, 0);
  objc_storeStrong((id *)&self->_optimizedBuffer, 0);
}

- (id)proxyArray
{
  v3 = self->_optimizedBuffer;
  unint64_t v4 = [(NSMutableData *)v3 length];
  v5 = (void *)MEMORY[0x1E4F1C978];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__SGCNContactIdentifierCollection_proxyArray__block_invoke;
  v11[3] = &unk_1E65B9128;
  v12 = v3;
  unint64_t v13 = v4 >> 4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__SGCNContactIdentifierCollection_proxyArray__block_invoke_2;
  v10[3] = &__block_descriptor_40_e5_Q8__0l;
  v10[4] = v4 >> 4;
  v6 = v3;
  v7 = objc_msgSend(v5, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v11, v10);
  v8 = objc_msgSend(v7, "_pas_proxyArrayByAppendingArray:", self->_unoptimizedIdentifiers);

  return v8;
}

id __45__SGCNContactIdentifierCollection_proxyArray__block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = *(void *)(a1 + 40);
  if (v4 <= a2) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C4A8], @"%tu out of range (count %tu)", a2, v4);
  }
  memset(out, 0, 45);
  uuid_unparse_upper((const unsigned __int8 *)([*(id *)(a1 + 32) bytes] + 16 * a2), out);
  qmemcpy(&out[36], ":ABPerson", 9);
  v5 = (void *)[[NSString alloc] initWithBytes:out length:45 encoding:1];
  return v5;
}

uint64_t __45__SGCNContactIdentifierCollection_proxyArray__block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (BOOL)_optimizeAndAddCNContactIdentifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length] == 45)
  {
    *(_OWORD *)in = 0u;
    memset(v12, 0, 30);
    if ([v4 getCString:in maxLength:46 encoding:1])
    {
      if (*(void *)&v12[5] == 0x6F7372655042413ALL && LOBYTE(v12[7]) == 110)
      {
        uint64_t v8 = 0;
        while (in[v8] - 97 >= 0x1A)
        {
          if (++v8 == 36)
          {
            LOBYTE(v12[5]) = 0;
            v10[0] = 0;
            v10[1] = 0;
            int v9 = uuid_parse(in, (unsigned __int8 *)v10);
            BOOL v6 = v9 == 0;
            if (!v9) {
              [(NSMutableData *)self->_optimizedBuffer appendBytes:v10 length:16];
            }
            goto LABEL_8;
          }
        }
      }
    }
  }
  BOOL v6 = 0;
LABEL_8:

  return v6;
}

- (void)addCNContactIdentifier:(id)a3
{
  id v4 = a3;
  if (!-[SGCNContactIdentifierCollection _optimizeAndAddCNContactIdentifier:](self, "_optimizeAndAddCNContactIdentifier:"))[(NSMutableArray *)self->_unoptimizedIdentifiers addObject:v4]; {
}
  }

- (SGCNContactIdentifierCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)SGCNContactIdentifierCollection;
  v2 = [(SGCNContactIdentifierCollection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    optimizedBuffer = v2->_optimizedBuffer;
    v2->_optimizedBuffer = (NSMutableData *)v3;

    uint64_t v5 = objc_opt_new();
    unoptimizedIdentifiers = v2->_unoptimizedIdentifiers;
    v2->_unoptimizedIdentifiers = (NSMutableArray *)v5;
  }
  return v2;
}

@end