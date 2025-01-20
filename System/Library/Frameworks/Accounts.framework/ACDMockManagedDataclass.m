@interface ACDMockManagedDataclass
- (id)enabledAccounts;
- (id)name;
- (id)provisionedAccounts;
- (id)supportedTypes;
- (id)syncableTypes;
- (void)setEnabledAccounts:(id)a3;
- (void)setName:(id)a3;
- (void)setProvisionedAccounts:(id)a3;
- (void)setSupportedTypes:(id)a3;
- (void)setSyncableTypes:(id)a3;
@end

@implementation ACDMockManagedDataclass

- (id)name
{
  return self->name;
}

- (void)setName:(id)a3
{
}

- (id)provisionedAccounts
{
  return self->provisionedAccounts;
}

- (void)setProvisionedAccounts:(id)a3
{
}

- (id)syncableTypes
{
  return self->syncableTypes;
}

- (void)setSyncableTypes:(id)a3
{
}

- (id)supportedTypes
{
  return self->supportedTypes;
}

- (void)setSupportedTypes:(id)a3
{
}

- (id)enabledAccounts
{
  return self->enabledAccounts;
}

- (void)setEnabledAccounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->enabledAccounts, 0);
  objc_storeStrong((id *)&self->supportedTypes, 0);
  objc_storeStrong((id *)&self->syncableTypes, 0);
  objc_storeStrong((id *)&self->provisionedAccounts, 0);

  objc_storeStrong((id *)&self->name, 0);
}

@end