@interface DNDSBackingStoreDictionaryContext
- (BOOL)redactSensitiveData;
- (DNDSApplicationIdentifierMapping)applicationIdentifierMapper;
- (DNDSBackingStoreDictionaryContext)initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 currentRecord:(id)a5 redactSensitiveData:(BOOL)a6 contactProvider:(id)a7 applicationIdentifierMapper:(id)a8;
- (DNDSBackingStoreDictionaryContext)initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 healingSource:(id)a5 redactSensitiveData:(BOOL)a6 contactProvider:(id)a7 applicationIdentifierMapper:(id)a8;
- (DNDSBackingStoreDictionaryContext)initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 redactSensitiveData:(BOOL)a5 contactProvider:(id)a6 applicationIdentifierMapper:(id)a7;
- (DNDSBackingStoreRecord)currentRecord;
- (DNDSContactProviding)contactProvider;
- (NSArray)arrayHealingSource;
- (NSDictionary)healingSource;
- (NSFastEnumeration)underlyingHealingSource;
- (id)_initWithContext:(id)a3;
- (id)_initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 healingSource:(id)a5 currentRecord:(id)a6 redactSensitiveData:(BOOL)a7 contactProvider:(id)a8 applicationIdentifierMapper:(id)a9;
- (id)copyWithCurrentRecord:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)destination;
- (unint64_t)partitionType;
- (void)setCurrentRecord:(id)a3;
- (void)setUnderlyingHealingSource:(id)a3;
@end

@implementation DNDSBackingStoreDictionaryContext

- (DNDSBackingStoreDictionaryContext)initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 redactSensitiveData:(BOOL)a5 contactProvider:(id)a6 applicationIdentifierMapper:(id)a7
{
  return (DNDSBackingStoreDictionaryContext *)[(DNDSBackingStoreDictionaryContext *)self _initWithDestination:a3 partitionType:a4 healingSource:0 currentRecord:0 redactSensitiveData:a5 contactProvider:a6 applicationIdentifierMapper:a7];
}

- (DNDSBackingStoreDictionaryContext)initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 currentRecord:(id)a5 redactSensitiveData:(BOOL)a6 contactProvider:(id)a7 applicationIdentifierMapper:(id)a8
{
  return (DNDSBackingStoreDictionaryContext *)[(DNDSBackingStoreDictionaryContext *)self _initWithDestination:a3 partitionType:a4 healingSource:0 currentRecord:a5 redactSensitiveData:a6 contactProvider:a7 applicationIdentifierMapper:a8];
}

- (DNDSBackingStoreDictionaryContext)initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 healingSource:(id)a5 redactSensitiveData:(BOOL)a6 contactProvider:(id)a7 applicationIdentifierMapper:(id)a8
{
  return (DNDSBackingStoreDictionaryContext *)[(DNDSBackingStoreDictionaryContext *)self _initWithDestination:a3 partitionType:a4 healingSource:a5 currentRecord:0 redactSensitiveData:a6 contactProvider:a7 applicationIdentifierMapper:a8];
}

- (id)_initWithDestination:(unint64_t)a3 partitionType:(unint64_t)a4 healingSource:(id)a5 currentRecord:(id)a6 redactSensitiveData:(BOOL)a7 contactProvider:(id)a8 applicationIdentifierMapper:(id)a9
{
  id v22 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)DNDSBackingStoreDictionaryContext;
  v18 = [(DNDSBackingStoreDictionaryContext *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_destination = a3;
    v18->_partitionType = a4;
    objc_storeStrong((id *)&v18->_underlyingHealingSource, a5);
    objc_storeStrong((id *)&v19->_currentRecord, a6);
    v19->_redactSensitiveData = a7;
    objc_storeStrong((id *)&v19->_contactProvider, a8);
    objc_storeStrong((id *)&v19->_applicationIdentifierMapper, a9);
  }

  return v19;
}

- (id)copyWithCurrentRecord:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(DNDSBackingStoreDictionaryContext *)self mutableCopy];
  [v5 setCurrentRecord:v4];

  v6 = (void *)[v5 copy];
  return v6;
}

- (DNDSContactProviding)contactProvider
{
  return self->_contactProvider;
}

- (DNDSApplicationIdentifierMapping)applicationIdentifierMapper
{
  return self->_applicationIdentifierMapper;
}

- (NSDictionary)healingSource
{
  if (!self->_underlyingHealingSource)
  {
    underlyingHealingSource = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    underlyingHealingSource = self->_underlyingHealingSource;
LABEL_5:
    id v4 = underlyingHealingSource;
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:
  return (NSDictionary *)v4;
}

- (NSArray)arrayHealingSource
{
  if (!self->_underlyingHealingSource)
  {
    underlyingHealingSource = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    underlyingHealingSource = self->_underlyingHealingSource;
LABEL_5:
    id v4 = underlyingHealingSource;
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:
  return (NSArray *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [DNDSBackingStoreDictionaryContext alloc];
  return [(DNDSBackingStoreDictionaryContext *)v4 _initWithContext:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [DNDSMutableBackingStoreDictionaryContext alloc];
  return [(DNDSBackingStoreDictionaryContext *)v4 _initWithContext:self];
}

- (id)_initWithContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DNDSBackingStoreDictionaryContext;
  v5 = [(DNDSBackingStoreDictionaryContext *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_destination = *((void *)v4 + 1);
    v5->_partitionType = *((void *)v4 + 2);
    objc_storeStrong((id *)&v5->_underlyingHealingSource, *((id *)v4 + 3));
    objc_storeStrong((id *)&v6->_currentRecord, *((id *)v4 + 4));
    v6->_redactSensitiveData = *((unsigned char *)v4 + 40);
    objc_storeStrong((id *)&v6->_contactProvider, *((id *)v4 + 6));
    objc_storeStrong((id *)&v6->_applicationIdentifierMapper, *((id *)v4 + 7));
  }

  return v6;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (unint64_t)partitionType
{
  return self->_partitionType;
}

- (NSFastEnumeration)underlyingHealingSource
{
  return self->_underlyingHealingSource;
}

- (void)setUnderlyingHealingSource:(id)a3
{
}

- (DNDSBackingStoreRecord)currentRecord
{
  return self->_currentRecord;
}

- (void)setCurrentRecord:(id)a3
{
}

- (BOOL)redactSensitiveData
{
  return self->_redactSensitiveData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifierMapper, 0);
  objc_storeStrong((id *)&self->_contactProvider, 0);
  objc_storeStrong((id *)&self->_currentRecord, 0);
  objc_storeStrong((id *)&self->_underlyingHealingSource, 0);
}

@end