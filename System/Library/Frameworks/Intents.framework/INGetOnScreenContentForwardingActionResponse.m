@interface INGetOnScreenContentForwardingActionResponse
+ (BOOL)supportsSecureCoding;
- (INGetOnScreenContentForwardingActionResponse)initWithCoder:(id)a3;
- (INGetOnScreenContentForwardingActionResponse)initWithNode:(id)a3 error:(id)a4;
- (WFOnScreenContentNode)node;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INGetOnScreenContentForwardingActionResponse

- (void).cxx_destruct
{
}

- (WFOnScreenContentNode)node
{
  return self->_node;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INGetOnScreenContentForwardingActionResponse;
  id v4 = a3;
  [(INIntentForwardingActionResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_node, @"node", v5.receiver, v5.super_class);
}

- (INGetOnScreenContentForwardingActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  objc_super v5 = (void *)getWFOnScreenContentNodeClass_softClass;
  uint64_t v23 = getWFOnScreenContentNodeClass_softClass;
  if (!getWFOnScreenContentNodeClass_softClass)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __getWFOnScreenContentNodeClass_block_invoke;
    v19[3] = &unk_1E5520EB8;
    v19[4] = &v20;
    __getWFOnScreenContentNodeClass_block_invoke((uint64_t)v19);
    objc_super v5 = (void *)v21[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v20, 8);
  v7 = [v4 decodeObjectOfClass:v6 forKey:@"node"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  v16 = [v4 decodeObjectOfClasses:v15 forKey:@"error"];
  v17 = [(INGetOnScreenContentForwardingActionResponse *)self initWithNode:v7 error:v16];

  return v17;
}

- (INGetOnScreenContentForwardingActionResponse)initWithNode:(id)a3 error:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INGetOnScreenContentForwardingActionResponse;
  v8 = [(INIntentForwardingActionResponse *)&v11 initWithError:a4];
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_node, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end