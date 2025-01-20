@interface CPLRecordStatus
- (id)initFromPQLResultSet:(id)a3 center:(id)a4 error:(id *)a5;
@end

@implementation CPLRecordStatus

- (id)initFromPQLResultSet:(id)a3 center:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 integerAtIndex:0];
  v11 = [v8 stringAtIndex:1];
  v12 = [v9 scopedIdentifierForLocalIdentifier:v11 scopeIndex:v10];

  if (v12)
  {
    v13 = [v8 stringAtIndex:2];
    id v14 = [v8 unsignedIntegerAtIndex:3];
    Class v15 = NSClassFromString(v13);
    if ([(objc_class *)v15 isSubclassOfClass:objc_opt_class()])
    {
      id v16 = [(objc_class *)v15 newRecordWithScopedIdentifier:v12];
      self = [(CPLRecordStatus *)self initWithRecord:v16 generation:v14];

      v17 = self;
    }
    else if (a5)
    {
      +[CPLErrors unknownError];
      v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }
  else if (a5)
  {
    +[CPLErrors invalidScopeErrorWithScopeIndex:v10];
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end