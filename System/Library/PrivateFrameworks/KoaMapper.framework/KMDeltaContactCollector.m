@interface KMDeltaContactCollector
- (BOOL)dropEverything;
- (KMDeltaContactCollector)init;
- (NSString)contactIdentifier;
- (unsigned)deltaType;
- (void)reset;
- (void)setContactIdentifier:(id)a3;
- (void)setDeltaType:(unsigned __int8)a3;
- (void)setDropEverything:(BOOL)a3;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation KMDeltaContactCollector

- (void).cxx_destruct
{
}

- (void)setDropEverything:(BOOL)a3
{
  self->_dropEverything = a3;
}

- (BOOL)dropEverything
{
  return self->_dropEverything;
}

- (void)setDeltaType:(unsigned __int8)a3
{
  self->_deltaType = a3;
}

- (unsigned)deltaType
{
  return self->_deltaType;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)reset
{
  self->_deltaType = 0;
  self->_contactIdentifier = 0;
  MEMORY[0x270F9A758]();
}

- (void)visitDeleteContactEvent:(id)a3
{
  self->_deltaType = 3;
  self->_contactIdentifier = [a3 contactIdentifier];
  MEMORY[0x270F9A758]();
}

- (void)visitUpdateContactEvent:(id)a3
{
  self->_deltaType = 2;
  id v6 = [a3 contact];
  v4 = [v6 identifier];
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v4;
}

- (void)visitAddContactEvent:(id)a3
{
  self->_deltaType = 1;
  id v6 = [a3 contact];
  v4 = [v6 identifier];
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v4;
}

- (void)visitDropEverythingEvent:(id)a3
{
  self->_dropEverything = 1;
}

- (KMDeltaContactCollector)init
{
  v3.receiver = self;
  v3.super_class = (Class)KMDeltaContactCollector;
  result = [(KMDeltaContactCollector *)&v3 init];
  if (result) {
    result->_deltaType = 0;
  }
  return result;
}

@end