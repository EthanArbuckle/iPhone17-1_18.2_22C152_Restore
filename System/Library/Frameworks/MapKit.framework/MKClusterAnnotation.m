@interface MKClusterAnnotation
- (BOOL)_isMKClusterAnnotation;
- (BOOL)isEqual:(id)a3;
- (CLLocationCoordinate2D)_averageCoordinate;
- (CLLocationCoordinate2D)coordinate;
- (MKClusterAnnotation)initWithMemberAnnotations:(NSArray *)memberAnnotations;
- (NSArray)memberAnnotations;
- (NSString)clusteringIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (unint64_t)hash;
- (void)_memberAnnotationCoordinateDidChange;
- (void)setClusteringIdentifier:(id)a3;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setTitle:(NSString *)title;
@end

@implementation MKClusterAnnotation

- (void)setTitle:(NSString *)title
{
  *(unsigned char *)&self->_flags |= 2u;
  v4 = (NSString *)[(NSString *)title copy];
  v5 = self->__title;
  self->__title = v4;
}

- (NSString)title
{
  title = self->__title;
  if (!title)
  {
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      title = 0;
    }
    else
    {
      v4 = [(MKClusterAnnotation *)self memberAnnotations];
      v5 = [v4 firstObject];

      if (objc_opt_respondsToSelector())
      {
        v6 = [v5 title];
        v7 = (NSString *)[v6 copy];
        v8 = self->__title;
        self->__title = v7;
      }
      *(unsigned char *)&self->_flags |= 2u;

      title = self->__title;
    }
  }

  return title;
}

- (void)setSubtitle:(NSString *)subtitle
{
  *(unsigned char *)&self->_flags |= 4u;
  v4 = (NSString *)[(NSString *)subtitle copy];
  v5 = self->__subtitle;
  self->__subtitle = v4;
}

- (NSString)subtitle
{
  subtitle = self->__subtitle;
  if (!subtitle)
  {
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
      subtitle = 0;
    }
    else
    {
      v4 = (void *)MEMORY[0x1E4F28EE0];
      v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_memberAnnotations, "count") - 1);
      v6 = [v4 localizedStringFromNumber:v5 numberStyle:1];

      v7 = _MKLocalizedStringFromThisBundle(@"MoreAnnotations");
      objc_msgSend(NSString, "stringWithFormat:", v7, v6);
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = self->__subtitle;
      self->__subtitle = v8;

      *(unsigned char *)&self->_flags |= 4u;
      subtitle = self->__subtitle;
    }
  }

  return subtitle;
}

- (CLLocationCoordinate2D)coordinate
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    [(MKClusterAnnotation *)self _averageCoordinate];
    self->__coordinate.double latitude = v3;
    self->__coordinate.double longitude = v4;
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | ((objc_opt_respondsToSelector() & 1) == 0);
  }
  double latitude = self->__coordinate.latitude;
  double longitude = self->__coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (MKClusterAnnotation)initWithMemberAnnotations:(NSArray *)memberAnnotations
{
  v8.receiver = self;
  v8.super_class = (Class)MKClusterAnnotation;
  CLLocationDegrees v4 = [(MKClusterAnnotation *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [(NSArray *)memberAnnotations copy];
    v6 = v4->_memberAnnotations;
    v4->_memberAnnotations = (NSArray *)v5;
  }
  return v4;
}

- (void)_memberAnnotationCoordinateDidChange
{
  [(MKClusterAnnotation *)self willChangeValueForKey:@"coordinate"];
  *(unsigned char *)&self->_flags &= ~1u;

  [(MKClusterAnnotation *)self didChangeValueForKey:@"coordinate"];
}

- (unint64_t)hash
{
  return [(NSArray *)self->_memberAnnotations hash];
}

- (BOOL)_isMKClusterAnnotation
{
  return 1;
}

- (CLLocationCoordinate2D)_averageCoordinate
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  CLLocationDegrees v3 = [(MKClusterAnnotation *)self memberAnnotations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    double v7 = 0.0;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * i) coordinate];
        double v8 = v8 + v10;
        double v7 = v7 + v11;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
  }

  v12 = [(MKClusterAnnotation *)self memberAnnotations];
  CLLocationDegrees v13 = v8 / (double)(unint64_t)[v12 count];
  v14 = [(MKClusterAnnotation *)self memberAnnotations];
  CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v13, v7 / (double)(unint64_t)[v14 count]);

  double latitude = v15.latitude;
  double longitude = v15.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![a3 _isMKClusterAnnotation]) {
    return 0;
  }
  uint64_t v5 = (void *)*((void *)a3 + 1);
  NSUInteger v6 = [(NSArray *)self->_memberAnnotations count];
  if (v6 != [v5 count]) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v7 = self->_memberAnnotations;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        CLLocationDegrees v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v5, "objectAtIndex:", v10 + i, (void)v17);

        if (v13 != v14)
        {
          BOOL v15 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      v10 += i;
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_14:

  return v15;
}

- (NSArray)memberAnnotations
{
  return self->_memberAnnotations;
}

- (NSString)clusteringIdentifier
{
  return self->_clusteringIdentifier;
}

- (void)setClusteringIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__subtitle, 0);
  objc_storeStrong((id *)&self->__title, 0);
  objc_storeStrong((id *)&self->_clusteringIdentifier, 0);

  objc_storeStrong((id *)&self->_memberAnnotations, 0);
}

@end