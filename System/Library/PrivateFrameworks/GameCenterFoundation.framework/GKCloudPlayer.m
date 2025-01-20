@interface GKCloudPlayer
+ (BOOL)supportsSecureCoding;
+ (void)getCurrentSignedInPlayerForContainer:(NSString *)containerName completionHandler:(void *)handler;
- (BOOL)isEqual:(id)a3;
- (GKCloudPlayer)initWithCoder:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayName;
- (id)playerID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation GKCloudPlayer

+ (void)getCurrentSignedInPlayerForContainer:(NSString *)containerName completionHandler:(void *)handler
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = handler;
  v6 = [v4 userErrorForCode:34 underlyingError:0];
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  v8 = os_log_GKDeveloper;
  if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
    +[GKCloudPlayer getCurrentSignedInPlayerForContainer:completionHandler:](v8);
  }
  v5[2](v5, 0, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKCloudPlayer)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKCloudPlayer;
  v5 = [(GKCloudPlayer *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(GKCloudPlayer *)v5 setIdentifier:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(GKCloudPlayer *)v5 setName:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GKCloudPlayer *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(GKCloudPlayer *)self name];
  [v4 encodeObject:v6 forKey:@"name"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    [v4 setIdentifier:self->_identifier];
    [v5 setName:self->_name];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(GKCloudPlayer *)self identifier];
    id v7 = [v5 identifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(GKCloudPlayer *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)GKCloudPlayer;
  id v4 = [(GKCloudPlayer *)&v9 description];
  id v5 = [(GKCloudPlayer *)self identifier];
  id v6 = [(GKCloudPlayer *)self name];
  id v7 = [v3 stringWithFormat:@"%@, id: %@, name: %@", v4, v5, v6];

  return v7;
}

- (id)playerID
{
  return self->_identifier;
}

- (id)displayName
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)getCurrentSignedInPlayerForContainer:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  v2 = @"GKCloudPlayer";
  _os_log_error_impl(&dword_1C2D22000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}@ is obsoleted and does nothing.", (uint8_t *)&v1, 0xCu);
}

@end