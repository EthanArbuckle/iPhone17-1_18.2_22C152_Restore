@interface AKDispatchingCalculation
+ (id)calculationWithDate:(id)a3 counter:(unint64_t)a4 algorithm:(id)a5 relinquisher:(id)a6;
- (AKDispatchingCalculation)initWithDate:(id)a3 counter:(unint64_t)a4 algorithm:(id)a5 relinquisher:(id)a6;
- (NSDate)dispatchDate;
- (NSString)algorithmIdentifier;
- (NSString)headerValue;
- (id)debugDescription;
- (unint64_t)dispatchCounter;
- (void)dealloc;
- (void)relinquish;
@end

@implementation AKDispatchingCalculation

- (AKDispatchingCalculation)initWithDate:(id)a3 counter:(unint64_t)a4 algorithm:(id)a5 relinquisher:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AKDispatchingCalculation;
  v14 = [(AKDispatchingCalculation *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dispatchDate, a3);
    v15->_dispatchCounter = a4;
    objc_storeStrong((id *)&v15->_algorithmIdentifier, a5);
    id v16 = objc_retainBlock(v13);
    id relinquishmentHandler = v15->_relinquishmentHandler;
    v15->_id relinquishmentHandler = v16;
  }
  return v15;
}

+ (id)calculationWithDate:(id)a3 counter:(unint64_t)a4 algorithm:(id)a5 relinquisher:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithDate:v12 counter:a4 algorithm:v11 relinquisher:v10];

  return v13;
}

- (void)dealloc
{
  [(AKDispatchingCalculation *)self relinquish];
  v3.receiver = self;
  v3.super_class = (Class)AKDispatchingCalculation;
  [(AKDispatchingCalculation *)&v3 dealloc];
}

- (NSString)headerValue
{
  unint64_t v3 = [(AKDispatchingCalculation *)self dispatchCounter];
  v4 = [(AKDispatchingCalculation *)self algorithmIdentifier];
  v5 = +[NSString stringWithFormat:@"%lu%@", v3, v4];

  return (NSString *)v5;
}

- (void)relinquish
{
  id relinquishmentHandler = (void (**)(id, SEL))self->_relinquishmentHandler;
  if (relinquishmentHandler)
  {
    relinquishmentHandler[2](relinquishmentHandler, a2);
    id relinquishmentHandler = (void (**)(id, SEL))self->_relinquishmentHandler;
  }
  self->_id relinquishmentHandler = 0;
}

- (id)debugDescription
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  algorithmIdentifier = self->_algorithmIdentifier;
  unint64_t dispatchCounter = self->_dispatchCounter;
  dispatchDate = self->_dispatchDate;
  id v8 = objc_retainBlock(self->_relinquishmentHandler);
  v9 = [(AKDispatchingCalculation *)self headerValue];
  id v10 = +[NSString stringWithFormat:@"<%@: %p {\n\tdispatchDate: %@,\n\tdispatchCounter: %lu,\n\talgorithmIdentifier: %@,\n\trelinquishmentHandler: %@,\n\theaderValue: %@,\n}>", v4, self, dispatchDate, dispatchCounter, algorithmIdentifier, v8, v9];

  return v10;
}

- (NSDate)dispatchDate
{
  return self->_dispatchDate;
}

- (NSString)algorithmIdentifier
{
  return self->_algorithmIdentifier;
}

- (unint64_t)dispatchCounter
{
  return self->_dispatchCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithmIdentifier, 0);
  objc_storeStrong((id *)&self->_dispatchDate, 0);

  objc_storeStrong(&self->_relinquishmentHandler, 0);
}

@end