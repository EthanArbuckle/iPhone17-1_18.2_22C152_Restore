@interface SGMailHeaders
+ (BOOL)supportsSecureCoding;
- (NSArray)cc;
- (NSArray)from;
- (NSArray)to;
- (NSString)messageId;
- (NSString)subject;
- (SGMailHeaders)initWithCoder:(id)a3;
- (SGMailHeaders)initWithMessageId:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCc:(id)a3;
- (void)setFrom:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTo:(id)a3;
@end

@implementation SGMailHeaders

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_subject, 0);

  objc_storeStrong((id *)&self->_messageId, 0);
}

- (void)setCc:(id)a3
{
}

- (NSArray)cc
{
  return self->_cc;
}

- (void)setTo:(id)a3
{
}

- (NSArray)to
{
  return self->_to;
}

- (void)setFrom:(id)a3
{
}

- (NSArray)from
{
  return self->_from;
}

- (void)setSubject:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGMailHeaders %@: %@>", self->_messageId, self->_subject];

  return v2;
}

- (SGMailHeaders)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v5 = objc_opt_class();
  v6 = sgLogHandle();
  v39 = [v4 robustDecodeObjectOfClass:v5 forKey:@"messageId" withCoder:v3 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v6];

  v7 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v8 = objc_opt_class();
  v9 = sgLogHandle();
  uint64_t v37 = [v7 robustDecodeObjectOfClass:v8 forKey:@"subject" withCoder:v3 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v9];

  v10 = (void *)MEMORY[0x1E4F93B90];
  v11 = (void *)MEMORY[0x1A6265250]();
  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  v15 = sgLogHandle();
  uint64_t v36 = [v10 robustDecodeObjectOfClasses:v14 forKey:@"from" withCoder:v3 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v15];

  v16 = (void *)MEMORY[0x1E4F93B90];
  v17 = (void *)MEMORY[0x1A6265250]();
  id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
  v21 = sgLogHandle();
  v22 = [v16 robustDecodeObjectOfClasses:v20 forKey:@"to" withCoder:v3 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v21];

  v23 = (void *)MEMORY[0x1E4F93B90];
  v24 = (void *)MEMORY[0x1A6265250]();
  id v25 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v26 = objc_opt_class();
  v27 = objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
  v28 = sgLogHandle();
  v29 = [v23 robustDecodeObjectOfClasses:v27 forKey:@"cc" withCoder:v3 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v28];

  if (v39 && ([v3 error], v30 = objc_claimAutoreleasedReturnValue(), v30, !v30))
  {
    v31 = [[SGMailHeaders alloc] initWithMessageId:v39];
    v33 = (void *)v37;
    [(SGMailHeaders *)v31 setSubject:v37];
    v34 = (void *)v36;
    [(SGMailHeaders *)v31 setFrom:v36];
    [(SGMailHeaders *)v31 setTo:v22];
    [(SGMailHeaders *)v31 setCc:v29];
    v32 = self;
  }
  else
  {
    v31 = 0;
    v33 = (void *)v37;
    v32 = self;
    v34 = (void *)v36;
  }

  return v31;
}

- (void)encodeWithCoder:(id)a3
{
  messageId = self->_messageId;
  id v5 = a3;
  [v5 encodeObject:messageId forKey:@"messageId"];
  [v5 encodeObject:self->_subject forKey:@"subject"];
  [v5 encodeObject:self->_from forKey:@"from"];
  [v5 encodeObject:self->_to forKey:@"to"];
  [v5 encodeObject:self->_cc forKey:@"cc"];
}

- (SGMailHeaders)initWithMessageId:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGMailHeaders.m", 27, @"Invalid parameter not satisfying: %@", @"messageId" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SGMailHeaders;
  v7 = [(SGMailHeaders *)&v11 init];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_messageId, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end