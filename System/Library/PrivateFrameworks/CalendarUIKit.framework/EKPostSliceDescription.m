@interface EKPostSliceDescription
- (EKPostSliceDescription)initWithOriginalSliceDescription:(id)a3;
- (EKSeriesDetails)createdSeriesDetails;
- (EKSeriesDetails)updatedMainSeriesDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCreatedSeriesDetails:(id)a3;
- (void)setUpdatedMainSeriesDetails:(id)a3;
@end

@implementation EKPostSliceDescription

- (id)description
{
  v14 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)EKPostSliceDescription;
  v3 = [(EKSliceDescription *)&v16 description];
  v15 = [(EKPostSliceDescription *)self updatedMainSeriesDetails];
  v4 = [v15 masterEvent];
  v5 = [v4 title];
  v6 = [(EKPostSliceDescription *)self createdSeriesDetails];
  v7 = [v6 masterEvent];
  v8 = [v7 localUID];
  v9 = [(EKPostSliceDescription *)self createdSeriesDetails];
  v10 = [v9 masterEvent];
  v11 = [v10 title];
  v12 = [v14 stringWithFormat:@"%@ :: Modified series - title: %@ :: Created series - localUID: %@, title: %@", v3, v5, v8, v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)EKPostSliceDescription;
  id v4 = [(EKSliceDescription *)&v8 copyWithZone:a3];
  v5 = [(EKPostSliceDescription *)self updatedMainSeriesDetails];
  [v4 setUpdatedMainSeriesDetails:v5];

  v6 = [(EKPostSliceDescription *)self createdSeriesDetails];
  [v4 setCreatedSeriesDetails:v6];

  return v4;
}

- (EKPostSliceDescription)initWithOriginalSliceDescription:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKPostSliceDescription;
  v5 = [(EKPostSliceDescription *)&v13 init];
  if (v5)
  {
    v6 = [v4 originalMainSeriesDetails];
    [(EKSliceDescription *)v5 setOriginalMainSeriesDetails:v6];

    v7 = [v4 originalEventToSliceOn];
    [(EKSliceDescription *)v5 setOriginalEventToSliceOn:v7];

    objc_super v8 = [EKSeriesDetails alloc];
    v9 = [v4 originalEventToSliceOn];
    uint64_t v10 = [(EKSeriesDetails *)v8 initWithEvent:v9];
    updatedMainSeriesDetails = v5->_updatedMainSeriesDetails;
    v5->_updatedMainSeriesDetails = (EKSeriesDetails *)v10;
  }
  return v5;
}

- (EKSeriesDetails)updatedMainSeriesDetails
{
  return (EKSeriesDetails *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdatedMainSeriesDetails:(id)a3
{
}

- (EKSeriesDetails)createdSeriesDetails
{
  return (EKSeriesDetails *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCreatedSeriesDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdSeriesDetails, 0);

  objc_storeStrong((id *)&self->_updatedMainSeriesDetails, 0);
}

@end