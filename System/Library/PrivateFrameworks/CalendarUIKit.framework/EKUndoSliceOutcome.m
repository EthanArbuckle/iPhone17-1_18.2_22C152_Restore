@interface EKUndoSliceOutcome
- (EKEvent)masterToDelete;
- (EKPostSliceDescription)originalPostSliceDescription;
- (EKSeriesDetails)createdSeriesDetails;
- (EKSeriesDetails)mainSeriesDetails;
- (EKUndoSliceOutcome)initWithOriginalPostSliceDescription:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initResliceFromOutcome:(id)a3;
- (void)_markExistingSeriesMasterAsChangedFromMaster:(id)a3;
- (void)setCreatedSeriesDetails:(id)a3;
- (void)setMainSeriesDetails:(id)a3;
- (void)setMasterToDelete:(id)a3;
@end

@implementation EKUndoSliceOutcome

- (EKUndoSliceOutcome)initWithOriginalPostSliceDescription:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EKUndoSliceOutcome;
  v6 = [(EKUndoSliceOutcome *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalPostSliceDescription, a3);
    v8 = [v5 originalMainSeriesDetails];
    uint64_t v9 = [v8 copy];
    mainSeriesDetails = v7->_mainSeriesDetails;
    v7->_mainSeriesDetails = (EKSeriesDetails *)v9;

    v11 = [v5 createdSeriesDetails];

    if (v11)
    {
      v12 = [v5 createdSeriesDetails];
      v13 = [v12 masterEvent];
      uint64_t v14 = [v13 copy];
      masterToDelete = v7->_masterToDelete;
      v7->_masterToDelete = (EKEvent *)v14;
    }
    v16 = [(EKPostSliceDescription *)v7->_originalPostSliceDescription updatedMainSeriesDetails];
    v17 = [v16 masterEvent];
    [(EKUndoSliceOutcome *)v7 _markExistingSeriesMasterAsChangedFromMaster:v17];
  }
  return v7;
}

- (id)initResliceFromOutcome:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EKUndoSliceOutcome;
  id v5 = [(EKUndoSliceOutcome *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 originalPostSliceDescription];
    originalPostSliceDescription = v5->_originalPostSliceDescription;
    v5->_originalPostSliceDescription = (EKPostSliceDescription *)v6;

    v8 = [(EKPostSliceDescription *)v5->_originalPostSliceDescription updatedMainSeriesDetails];
    uint64_t v9 = [v8 copy];
    mainSeriesDetails = v5->_mainSeriesDetails;
    v5->_mainSeriesDetails = (EKSeriesDetails *)v9;

    v11 = [(EKPostSliceDescription *)v5->_originalPostSliceDescription createdSeriesDetails];
    uint64_t v12 = [v11 copy];
    createdSeriesDetails = v5->_createdSeriesDetails;
    v5->_createdSeriesDetails = (EKSeriesDetails *)v12;

    uint64_t v14 = [(EKSeriesDetails *)v5->_createdSeriesDetails masterEvent];
    [v14 markAsUndeleted];

    v15 = [(EKSliceDescription *)v5->_originalPostSliceDescription originalMainSeriesDetails];
    v16 = [v15 masterEvent];
    [(EKUndoSliceOutcome *)v5 _markExistingSeriesMasterAsChangedFromMaster:v16];
  }
  return v5;
}

- (void)_markExistingSeriesMasterAsChangedFromMaster:(id)a3
{
  if (a3)
  {
    mainSeriesDetails = self->_mainSeriesDetails;
    id v5 = a3;
    uint64_t v6 = [(EKSeriesDetails *)mainSeriesDetails masterEvent];
    id v7 = [v5 inverseObjectWithObject:v6 diff:0];

    [(EKSeriesDetails *)self->_mainSeriesDetails setMasterEvent:v7];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(EKUndoSliceOutcome *)self originalPostSliceDescription];
  uint64_t v6 = (void *)[v4 initWithOriginalPostSliceDescription:v5];

  id v7 = [(EKUndoSliceOutcome *)self masterToDelete];
  [v6 setMasterToDelete:v7];

  v8 = [(EKUndoSliceOutcome *)self mainSeriesDetails];
  [v6 setMainSeriesDetails:v8];

  uint64_t v9 = [(EKUndoSliceOutcome *)self createdSeriesDetails];
  [v6 setCreatedSeriesDetails:v9];

  return v6;
}

- (EKEvent)masterToDelete
{
  return (EKEvent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMasterToDelete:(id)a3
{
}

- (EKSeriesDetails)mainSeriesDetails
{
  return (EKSeriesDetails *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMainSeriesDetails:(id)a3
{
}

- (EKSeriesDetails)createdSeriesDetails
{
  return (EKSeriesDetails *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCreatedSeriesDetails:(id)a3
{
}

- (EKPostSliceDescription)originalPostSliceDescription
{
  return (EKPostSliceDescription *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalPostSliceDescription, 0);
  objc_storeStrong((id *)&self->_createdSeriesDetails, 0);
  objc_storeStrong((id *)&self->_mainSeriesDetails, 0);

  objc_storeStrong((id *)&self->_masterToDelete, 0);
}

@end