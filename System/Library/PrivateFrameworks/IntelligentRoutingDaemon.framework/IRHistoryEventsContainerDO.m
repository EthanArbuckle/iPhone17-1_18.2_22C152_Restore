@interface IRHistoryEventsContainerDO
+ (BOOL)supportsSecureCoding;
+ (IRHistoryEventsContainerDO)historyEventsContainerDOWithHistoryEvents:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHistoryEventsContainerDO:(id)a3;
- (IRHistoryEventsContainerDO)initWithCoder:(id)a3;
- (IRHistoryEventsContainerDO)initWithHistoryEvents:(id)a3;
- (NSArray)historyEvents;
- (id)copyWithReplacementHistoryEvents:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRHistoryEventsContainerDO

- (NSArray)historyEvents
{
  return self->_historyEvents;
}

- (IRHistoryEventsContainerDO)initWithHistoryEvents:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRHistoryEventsContainerDO;
  v6 = [(IRHistoryEventsContainerDO *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_historyEvents, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

+ (IRHistoryEventsContainerDO)historyEventsContainerDOWithHistoryEvents:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithHistoryEvents:v4];

  return (IRHistoryEventsContainerDO *)v5;
}

- (id)copyWithReplacementHistoryEvents:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithHistoryEvents:v3];

  return v4;
}

- (BOOL)isEqualToHistoryEventsContainerDO:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4
    || (int v6 = self->_historyEvents != 0,
        [v4 historyEvents],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = v7 == 0,
        v7,
        v6 == v8))
  {
    char v11 = 0;
  }
  else
  {
    historyEvents = self->_historyEvents;
    if (historyEvents)
    {
      v10 = [v5 historyEvents];
      char v11 = [(NSArray *)historyEvents isEqual:v10];
    }
    else
    {
      char v11 = 1;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRHistoryEventsContainerDO *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRHistoryEventsContainerDO *)self isEqualToHistoryEventsContainerDO:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_historyEvents hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRHistoryEventsContainerDO)initWithCoder:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  int v8 = [v4 decodeObjectOfClasses:v7 forKey:@"historyEvents"];

  if (!v8)
  {
    v16 = [v4 error];

    if (v16) {
      goto LABEL_5;
    }
LABEL_6:
    self = [(IRHistoryEventsContainerDO *)self initWithHistoryEvents:v8];
    v17 = self;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  objc_super v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  char v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRHistoryEventsContainerDO key \"historyEvents\" (expected %@, decoded %@)", v10, v12, 0];
  uint64_t v19 = *MEMORY[0x263F08320];
  v20[0] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  v15 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRHistoryEventsContainerDOOCNTErrorDomain" code:3 userInfo:v14];
  [v4 failWithError:v15];

LABEL_5:
  v17 = 0;
LABEL_7:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  historyEvents = self->_historyEvents;
  if (historyEvents) {
    [a3 encodeObject:historyEvents forKey:@"historyEvents"];
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<IRHistoryEventsContainerDO | historyEvents:%@>", self->_historyEvents];

  return v2;
}

@end