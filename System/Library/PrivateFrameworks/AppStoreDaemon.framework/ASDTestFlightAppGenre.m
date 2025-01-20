@interface ASDTestFlightAppGenre
+ (BOOL)supportsSecureCoding;
- (ASDTestFlightAppGenre)initWithCoder:(id)a3;
- (ASDTestFlightAppGenre)initWithGenre:(id)a3 genreID:(id)a4;
- (NSNumber)genreID;
- (NSString)genre;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDTestFlightAppGenre

- (ASDTestFlightAppGenre)initWithGenre:(id)a3 genreID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASDTestFlightAppGenre;
  v9 = [(ASDTestFlightAppGenre *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_genre, a3);
    objc_storeStrong((id *)&v10->_genreID, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDTestFlightAppGenre allocWithZone:](ASDTestFlightAppGenre, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_genre copyWithZone:a3];
  genre = v5->_genre;
  v5->_genre = (NSString *)v6;

  uint64_t v8 = [(NSNumber *)self->_genreID copyWithZone:a3];
  genreID = v5->_genreID;
  v5->_genreID = (NSNumber *)v8;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDTestFlightAppGenre)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GE"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GI"];

  id v7 = [(ASDTestFlightAppGenre *)self initWithGenre:v5 genreID:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  genre = self->_genre;
  id v5 = a3;
  [v5 encodeObject:genre forKey:@"GE"];
  [v5 encodeObject:self->_genreID forKey:@"GI"];
}

- (NSString)genre
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)genreID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreID, 0);
  objc_storeStrong((id *)&self->_genre, 0);
}

@end