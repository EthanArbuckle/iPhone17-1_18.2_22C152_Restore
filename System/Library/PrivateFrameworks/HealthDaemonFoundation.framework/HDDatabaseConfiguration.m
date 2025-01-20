@interface HDDatabaseConfiguration
- (HDContentProtectionManager)contentProtectionManager;
- (HDDatabaseConfiguration)initWithBehavior:(id)a3 concurrentReaderLimit:(unint64_t)a4 contentProtectionManager:(id)a5;
- (_HKBehavior)behavior;
- (unint64_t)concurrentReaderLimit;
- (void)setContentProtectionManager:(id)a3;
@end

@implementation HDDatabaseConfiguration

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (HDDatabaseConfiguration)initWithBehavior:(id)a3 concurrentReaderLimit:(unint64_t)a4 contentProtectionManager:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDDatabaseConfiguration;
  v11 = [(HDDatabaseConfiguration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_behavior, a3);
    v12->_concurrentReaderLimit = a4;
    objc_storeStrong((id *)&v12->_contentProtectionManager, a5);
  }

  return v12;
}

- (unint64_t)concurrentReaderLimit
{
  return self->_concurrentReaderLimit;
}

- (HDContentProtectionManager)contentProtectionManager
{
  return self->_contentProtectionManager;
}

- (void)setContentProtectionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtectionManager, 0);

  objc_storeStrong((id *)&self->_behavior, 0);
}

@end