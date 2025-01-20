@interface CTStewieIMessageLiteFetchMessage
+ (BOOL)supportsSecureCoding;
+ (int64_t)maxNumberOfShortHandlesInFetch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOther:(id)a3;
- (CTStewieIMessageLiteFetchMessage)initWithCoder:(id)a3;
- (CTStewieIMessageLiteFetchMessage)initWithShortHandles:(id)a3 error:(id *)p_isa;
- (NSArray)shortHandles;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setShortHandles:(id)a3;
@end

@implementation CTStewieIMessageLiteFetchMessage

- (CTStewieIMessageLiteFetchMessage)initWithShortHandles:(id)a3 error:(id *)p_isa
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  if (v7 && [v7 count])
  {
    if ((unint64_t)[v8 count] < 0x18)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(_anonymous_namespace_ **)(*((void *)&v24 + 1) + 8 * i);
            objc_opt_class();
            {
              if (p_isa)
              {
                v20 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v28 = *MEMORY[0x1E4F28568];
                v29 = @"Invalid shortHandle";
                v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
                *p_isa = [v20 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v21];
              }
              goto LABEL_22;
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v30 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      v23.receiver = self;
      v23.super_class = (Class)CTStewieIMessageLiteFetchMessage;
      v19 = [(CTStewieIMessageLiteFetchMessage *)&v23 init];
      p_isa = (id *)&v19->super.isa;
      if (v19)
      {
        objc_storeStrong((id *)&v19->_shortHandles, a3);
        self = p_isa;
        p_isa = (id *)&self->super.isa;
      }
      else
      {
        self = 0;
      }
    }
    else if (p_isa)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32 = @"Too many short handles";
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      *p_isa = [v9 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v10];

LABEL_22:
      p_isa = 0;
    }
  }
  else if (p_isa)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v34[0] = @"Short handles are missing";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    *p_isa = [v11 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v12];

    goto LABEL_22;
  }

  return (CTStewieIMessageLiteFetchMessage *)p_isa;
}

- (BOOL)isEqualToOther:(id)a3
{
  id v4 = a3;
  v5 = [(CTStewieIMessageLiteFetchMessage *)self shortHandles];
  v6 = [v4 shortHandles];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    id v7 = [(CTStewieIMessageLiteFetchMessage *)self shortHandles];
    v8 = [v4 shortHandles];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTStewieIMessageLiteFetchMessage *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTStewieIMessageLiteFetchMessage *)self isEqualToOther:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTStewieIMessageLiteFetchMessage *)self shortHandles];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setShortHandles:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CTStewieIMessageLiteFetchMessage *)self shortHandles];
  [v5 encodeObject:v4 forKey:@"shortHandles"];
}

- (CTStewieIMessageLiteFetchMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"shortHandles"];
  char v9 = [(CTStewieIMessageLiteFetchMessage *)self initWithShortHandles:v8 error:0];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)maxNumberOfShortHandlesInFetch
{
  return 23;
}

- (NSArray)shortHandles
{
  return self->_shortHandles;
}

- (void)setShortHandles:(id)a3
{
}

- (void).cxx_destruct
{
}

@end