@interface CTLazuliSuggestedActionShowLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSuggestedActionShowLocation:(id)a3;
- (CTLazuliSuggestedActionShowCoordinates)coordinates;
- (CTLazuliSuggestedActionShowLocation)initWithCoder:(id)a3;
- (CTLazuliSuggestedActionShowLocation)initWithReflection:(const void *)a3;
- (CTLazuliSuggestedActionShowQuery)query;
- (NSString)fallbackUrl;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCoordinates:(id)a3;
- (void)setFallbackUrl:(id)a3;
- (void)setLabel:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation CTLazuliSuggestedActionShowLocation

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliSuggestedActionShowLocation *)self coordinates];
  [v3 appendFormat:@", coordinates = %@", v4];

  v5 = [(CTLazuliSuggestedActionShowLocation *)self query];
  [v3 appendFormat:@", query = %@", v5];

  v6 = [(CTLazuliSuggestedActionShowLocation *)self label];
  [v3 appendFormat:@", label = %@", v6];

  v7 = [(CTLazuliSuggestedActionShowLocation *)self fallbackUrl];
  [v3 appendFormat:@", fallbackUrl = %@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionShowLocation:(id)a3
{
  id v6 = a3;
  v7 = [(CTLazuliSuggestedActionShowLocation *)self coordinates];
  if (v7 || ([v6 coordinates], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliSuggestedActionShowLocation *)self coordinates];
    v4 = [v6 coordinates];
    if (([v3 isEqualToCTLazuliSuggestedActionShowCoordinates:v4] & 1) == 0)
    {

      char v8 = 0;
      goto LABEL_36;
    }
    int v25 = 1;
  }
  else
  {
    v23 = 0;
    int v25 = 0;
  }
  v9 = [(CTLazuliSuggestedActionShowLocation *)self query];
  if (v9 || ([v6 query], (v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v26 = [(CTLazuliSuggestedActionShowLocation *)self query];
    v24 = [v6 query];
    if ((objc_msgSend(v26, "isEqualToCTLazuliSuggestedActionShowQuery:") & 1) == 0)
    {

      if (v9) {
      else
      }

      char v8 = 0;
      if ((v25 & 1) == 0) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
    int v21 = 1;
  }
  else
  {
    v19 = 0;
    int v21 = 0;
  }
  v10 = [(CTLazuliSuggestedActionShowLocation *)self label];
  if (v10 || ([v6 label], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = [(CTLazuliSuggestedActionShowLocation *)self label];
    v20 = [v6 label];
    if (!objc_msgSend(v22, "isEqualToString:"))
    {
      char v8 = 0;
      goto LABEL_27;
    }
    int v18 = 1;
  }
  else
  {
    v17 = 0;
    int v18 = 0;
  }
  v11 = [(CTLazuliSuggestedActionShowLocation *)self fallbackUrl];
  if (v11 || ([v6 fallbackUrl], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = [(CTLazuliSuggestedActionShowLocation *)self fallbackUrl];
    v13 = [v6 fallbackUrl];
    char v8 = [v12 isEqualToString:v13];

    if (v11)
    {

      if (!v18) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    v15 = (void *)v16;
  }
  else
  {
    v15 = 0;
    char v8 = 1;
  }

  if (v18)
  {
LABEL_27:
  }
LABEL_28:
  if (!v10) {

  }
  if (v21)
  {
  }
  if (!v9) {

  }
  if (v25)
  {
LABEL_35:
  }
LABEL_36:
  if (!v7) {

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliSuggestedActionShowLocation *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSuggestedActionShowLocation *)self isEqualToCTLazuliSuggestedActionShowLocation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliSuggestedActionShowLocation allocWithZone:a3];
  [(CTLazuliSuggestedActionShowLocation *)v4 setCoordinates:self->_coordinates];
  [(CTLazuliSuggestedActionShowLocation *)v4 setQuery:self->_query];
  [(CTLazuliSuggestedActionShowLocation *)v4 setLabel:self->_label];
  [(CTLazuliSuggestedActionShowLocation *)v4 setFallbackUrl:self->_fallbackUrl];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_coordinates forKey:@"kCoordinatesKey"];
  [v4 encodeObject:self->_query forKey:@"kQueryKey"];
  [v4 encodeObject:self->_label forKey:@"kLabelKey"];
  [v4 encodeObject:self->_fallbackUrl forKey:@"kFallbackUrlKey"];
}

- (CTLazuliSuggestedActionShowLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliSuggestedActionShowLocation;
  v5 = [(CTLazuliSuggestedActionShowLocation *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCoordinatesKey"];
    coordinates = v5->_coordinates;
    v5->_coordinates = (CTLazuliSuggestedActionShowCoordinates *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kQueryKey"];
    query = v5->_query;
    v5->_query = (CTLazuliSuggestedActionShowQuery *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kLabelKey"];
    label = v5->_label;
    v5->_label = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFallbackUrlKey"];
    fallbackUrl = v5->_fallbackUrl;
    v5->_fallbackUrl = (NSString *)v12;
  }
  return v5;
}

- (CTLazuliSuggestedActionShowLocation)initWithReflection:(const void *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CTLazuliSuggestedActionShowLocation;
  id v4 = [(CTLazuliSuggestedActionShowLocation *)&v22 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (*((unsigned char *)a3 + 16))
  {
    uint64_t v6 = [CTLazuliSuggestedActionShowCoordinates alloc];
    if (!*((unsigned char *)a3 + 16)) {
      goto LABEL_24;
    }
    uint64_t v7 = [(CTLazuliSuggestedActionShowCoordinates *)v6 initWithReflection:a3];
    coordinates = v5->_coordinates;
    v5->_coordinates = (CTLazuliSuggestedActionShowCoordinates *)v7;
  }
  else
  {
    coordinates = v4->_coordinates;
    v4->_coordinates = 0;
  }

  if (!*((unsigned char *)a3 + 56))
  {
    query = v5->_query;
    v5->_query = 0;
    goto LABEL_10;
  }
  v9 = [CTLazuliSuggestedActionShowQuery alloc];
  if (*((unsigned char *)a3 + 56))
  {
    uint64_t v10 = [(CTLazuliSuggestedActionShowQuery *)v9 initWithReflection:(char *)a3 + 24];
    query = v5->_query;
    v5->_query = (CTLazuliSuggestedActionShowQuery *)v10;
LABEL_10:

    if (*((unsigned char *)a3 + 88))
    {
      if (*((char *)a3 + 87) >= 0) {
        uint64_t v12 = (char *)a3 + 64;
      }
      else {
        uint64_t v12 = (char *)*((void *)a3 + 8);
      }
      uint64_t v13 = [NSString stringWithUTF8String:v12];
      label = v5->_label;
      v5->_label = (NSString *)v13;
    }
    else
    {
      label = v5->_label;
      v5->_label = 0;
    }

    if (*((unsigned char *)a3 + 120))
    {
      v17 = (char *)*((void *)a3 + 12);
      uint64_t v16 = (char *)a3 + 96;
      objc_super v15 = v17;
      if (v16[23] >= 0) {
        int v18 = v16;
      }
      else {
        int v18 = v15;
      }
      uint64_t v19 = [NSString stringWithUTF8String:v18];
      fallbackUrl = v5->_fallbackUrl;
      v5->_fallbackUrl = (NSString *)v19;
    }
    else
    {
      fallbackUrl = v5->_fallbackUrl;
      v5->_fallbackUrl = 0;
    }

    return v5;
  }
LABEL_24:
  result = (CTLazuliSuggestedActionShowLocation *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliSuggestedActionShowCoordinates)coordinates
{
  return self->_coordinates;
}

- (void)setCoordinates:(id)a3
{
}

- (CTLazuliSuggestedActionShowQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)fallbackUrl
{
  return self->_fallbackUrl;
}

- (void)setFallbackUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackUrl, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_coordinates, 0);
}

@end