@interface _HMUserSettingEntry
- (NSArray)constraints;
- (NSString)keyPath;
- (_HMUserSettingEntry)initWithKeyPath:(id)a3 constraintArray:(id)a4;
@end

@implementation _HMUserSettingEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (_HMUserSettingEntry)initWithKeyPath:(id)a3 constraintArray:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HMUserSettingEntry;
  v9 = [(_HMUserSettingEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPath, a3);
    objc_storeStrong((id *)&v10->_constraints, a4);
  }

  return v10;
}

@end