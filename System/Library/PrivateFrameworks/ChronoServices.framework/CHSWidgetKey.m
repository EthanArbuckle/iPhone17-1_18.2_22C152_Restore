@interface CHSWidgetKey
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSWidget)widget;
- (CHSWidgetKey)initWithCoder:(id)a3;
- (CHSWidgetKey)initWithWidget:(id)a3 metrics:(id)a4;
- (CHSWidgetKey)initWithWidget:(id)a3 metrics:(id)a4 hostIdentifier:(id)a5;
- (CHSWidgetMetrics)metrics;
- (NSString)hostIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetKey

- (CHSWidgetKey)initWithWidget:(id)a3 metrics:(id)a4
{
  return [(CHSWidgetKey *)self initWithWidget:a3 metrics:a4 hostIdentifier:0];
}

- (CHSWidgetKey)initWithWidget:(id)a3 metrics:(id)a4 hostIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CHSWidgetKey;
  v11 = [(CHSWidgetKey *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    widget = v11->_widget;
    v11->_widget = (CHSWidget *)v12;

    uint64_t v14 = [v9 copy];
    metrics = v11->_metrics;
    v11->_metrics = (CHSWidgetMetrics *)v14;

    uint64_t v16 = [v10 copy];
    hostIdentifier = v11->_hostIdentifier;
    v11->_hostIdentifier = (NSString *)v16;
  }
  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<CHSWidgetKey widget=%@ metrics=%@ hostIdentifier=%@>", self->_widget, self->_metrics, self->_hostIdentifier];
}

- (unint64_t)hash
{
  unint64_t v3 = [(CHSWidget *)self->_widget hash];
  return 7 * v3 * [(CHSWidgetMetrics *)self->_metrics hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  widget = self->_widget;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __24__CHSWidgetKey_isEqual___block_invoke;
  v20[3] = &unk_1E56C81C8;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendObject:widget counterpart:v20];
  metrics = self->_metrics;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __24__CHSWidgetKey_isEqual___block_invoke_2;
  v18[3] = &unk_1E56C81C8;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendObject:metrics counterpart:v18];
  hostIdentifier = self->_hostIdentifier;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __24__CHSWidgetKey_isEqual___block_invoke_3;
  v16[3] = &unk_1E56C8508;
  id v13 = v10;
  id v17 = v13;
  id v14 = (id)[v5 appendString:hostIdentifier counterpart:v16];
  LOBYTE(v10) = [v5 isEqual];

  return (char)v10;
}

id __24__CHSWidgetKey_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __24__CHSWidgetKey_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __24__CHSWidgetKey_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_widget forKey:@"_w"];
  [v4 encodeObject:self->_metrics forKey:@"_m"];
  [v4 encodeObject:self->_hostIdentifier forKey:@"_hi"];
}

- (CHSWidgetKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"_w"];

  id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"_m"];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hi"];
  id v10 = 0;
  if (v6 && v8)
  {
    self = [(CHSWidgetKey *)self initWithWidget:v6 metrics:v8 hostIdentifier:v9];
    id v10 = self;
  }

  return v10;
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

@end