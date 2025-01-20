@interface IEEvent
+ (id)normalizeUtterance:(id)a3;
- (BOOL)isEqual:(id)a3;
- (IEEvent)initWithId:(id)a3;
- (IEEvent)initWithId:(id)a3 withName:(id)a4;
- (IEEvent)initWithName:(id)a3;
- (IEEvent)initWithName:(id)a3 withId:(id)a4;
- (IENLParameters)producer;
- (NSArray)parsers;
- (NSDictionary)slots;
- (NSString)eventId;
- (NSString)name;
- (void)setEventId:(id)a3;
- (void)setName:(id)a3;
- (void)setParsers:(id)a3;
- (void)setProducer:(id)a3;
- (void)setSlots:(id)a3;
@end

@implementation IEEvent

- (IEEvent)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IEEvent;
  v6 = [(IEEvent *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    eventId = v7->_eventId;
    v7->_eventId = (NSString *)&stru_26ED2AF50;

    slots = v7->_slots;
    v7->_slots = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v7;
}

- (IEEvent)initWithName:(id)a3 withId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IEEvent;
  v9 = [(IEEvent *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_eventId, a4);
    slots = v10->_slots;
    v10->_slots = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v10;
}

- (IEEvent)initWithId:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IEEvent;
  v6 = [(IEEvent *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    name = v6->_name;
    v6->_name = (NSString *)&stru_26ED2AF50;

    objc_storeStrong((id *)&v7->_eventId, a3);
    slots = v7->_slots;
    v7->_slots = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v7;
}

- (IEEvent)initWithId:(id)a3 withName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IEEvent;
  v9 = [(IEEvent *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a4);
    objc_storeStrong((id *)&v10->_eventId, a3);
    slots = v10->_slots;
    v10->_slots = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v10;
}

+ (id)normalizeUtterance:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    std::string::basic_string[abi:ne180100]<0>(&v10, (char *)[v3 UTF8String]);
    siri::intelligence::Utterances::GetNormalizedText(&v10, (uint64_t)__p);
    if (v9 >= 0) {
      id v5 = __p;
    }
    else {
      id v5 = (void **)__p[0];
    }
    v6 = [NSString stringWithUTF8String:v5];
    if (v9 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v10.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IEEvent *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4)
    {
      BOOL v25 = 1;
    }
    else
    {
      id v5 = v4;
      v6 = [(IEEvent *)self name];
      id v7 = [(IEEvent *)v5 name];
      char v8 = [v6 isEqualToString:v7];

      if ((v8 & 1) == 0) {
        goto LABEL_14;
      }
      char v9 = [(IEEvent *)self eventId];
      std::string v10 = [(IEEvent *)v5 eventId];
      char v11 = [v9 isEqualToString:v10];

      if ((v11 & 1) == 0) {
        goto LABEL_14;
      }
      v12 = [(IEEvent *)self slots];
      objc_super v13 = [(IEEvent *)v5 slots];
      char v14 = [v12 isEqualToDictionary:v13];

      if ((v14 & 1) == 0) {
        goto LABEL_14;
      }
      v15 = [(IEEvent *)self producer];
      v16 = [(IEEvent *)v5 producer];
      char v17 = [v15 isEqual:v16];

      if ((v17 & 1) == 0) {
        goto LABEL_14;
      }
      v18 = [(IEEvent *)self parsers];
      uint64_t v19 = [v18 count];
      v20 = [(IEEvent *)v5 parsers];
      uint64_t v21 = [v20 count];

      if (v19 == v21)
      {
        unint64_t v22 = 0;
        do
        {
          v23 = [(IEEvent *)self parsers];
          unint64_t v24 = [v23 count];

          BOOL v25 = v24 <= v22;
          if (v24 <= v22) {
            break;
          }
          v26 = [(IEEvent *)self parsers];
          v27 = [v26 objectAtIndex:v22];
          v28 = [(IEEvent *)v5 parsers];
          v29 = [v28 objectAtIndex:v22];
          char v30 = [v27 isEqual:v29];

          ++v22;
        }
        while ((v30 & 1) != 0);
      }
      else
      {
LABEL_14:
        BOOL v25 = 0;
      }
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (NSString)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)slots
{
  return self->_slots;
}

- (void)setSlots:(id)a3
{
}

- (NSArray)parsers
{
  return self->_parsers;
}

- (void)setParsers:(id)a3
{
}

- (IENLParameters)producer
{
  return self->_producer;
}

- (void)setProducer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_producer, 0);
  objc_storeStrong((id *)&self->_parsers, 0);
  objc_storeStrong((id *)&self->_slots, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_eventId, 0);
}

@end