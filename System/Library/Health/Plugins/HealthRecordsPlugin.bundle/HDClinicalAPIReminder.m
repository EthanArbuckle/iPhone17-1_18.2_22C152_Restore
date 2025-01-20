@interface HDClinicalAPIReminder
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReminder:(id)a3;
- (BOOL)wasPosted;
- (HDClinicalAPIReminder)init;
- (HDClinicalAPIReminder)initWithSource:(id)a3 creationDate:(id)a4 postDate:(id)a5;
- (HKSource)source;
- (NSDate)creationDate;
- (NSDate)postDate;
- (id)_init;
- (void)_setCreationDate:(id)a3;
- (void)_setPostDate:(id)a3;
- (void)_setSource:(id)a3;
@end

@implementation HDClinicalAPIReminder

- (HDClinicalAPIReminder)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HDClinicalAPIReminder;
  return [(HDClinicalAPIReminder *)&v3 init];
}

- (HDClinicalAPIReminder)initWithSource:(id)a3 creationDate:(id)a4 postDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDClinicalAPIReminder;
  v11 = [(HDClinicalAPIReminder *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(HDClinicalAPIReminder *)v11 _setSource:v8];
    [(HDClinicalAPIReminder *)v12 _setCreationDate:v9];
    [(HDClinicalAPIReminder *)v12 _setPostDate:v10];
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDClinicalAPIReminder *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else if ([(HDClinicalAPIReminder *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = [(HDClinicalAPIReminder *)self isEqualToReminder:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToReminder:(id)a3
{
  id v5 = a3;
  v6 = [(HDClinicalAPIReminder *)self source];
  v7 = [v5 source];
  if (v6 != v7)
  {
    uint64_t v8 = [v5 source];
    if (!v8)
    {
      unsigned __int8 v17 = 0;
      goto LABEL_27;
    }
    objc_super v3 = (void *)v8;
    id v9 = [(HDClinicalAPIReminder *)self source];
    id v10 = [v5 source];
    if (![v9 isEqual:v10])
    {
      unsigned __int8 v17 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v32 = v10;
    v33 = v9;
  }
  v11 = [(HDClinicalAPIReminder *)self creationDate];
  v12 = [v5 creationDate];
  if (v11 != v12)
  {
    uint64_t v13 = [v5 creationDate];
    if (!v13)
    {
      unsigned __int8 v17 = 0;
LABEL_21:

      goto LABEL_22;
    }
    objc_super v14 = (void *)v13;
    v15 = [(HDClinicalAPIReminder *)self creationDate];
    v16 = [v5 creationDate];
    if (([v15 isEqualToDate:v16] & 1) == 0)
    {

      unsigned __int8 v17 = 0;
LABEL_22:
      BOOL v25 = v6 == v7;
      goto LABEL_25;
    }
    v28 = v16;
    v29 = v15;
    v30 = v14;
  }
  v18 = [(HDClinicalAPIReminder *)self postDate];
  uint64_t v19 = [v5 postDate];
  unsigned __int8 v17 = v18 == (void *)v19;
  if (v18 == (void *)v19)
  {

    goto LABEL_19;
  }
  v20 = (void *)v19;
  v31 = v11;
  uint64_t v21 = [v5 postDate];
  if (!v21)
  {

LABEL_19:
    if (v11 != v12)
    {
    }
    goto LABEL_21;
  }
  v22 = (void *)v21;
  v27 = v3;
  v23 = [(HDClinicalAPIReminder *)self postDate];
  v24 = [v5 postDate];
  unsigned __int8 v17 = [v23 isEqualToDate:v24];

  if (v31 == v12)
  {
  }
  else
  {
  }
  BOOL v25 = v6 == v7;
  objc_super v3 = v27;
LABEL_25:
  id v10 = v32;
  id v9 = v33;
  if (!v25) {
    goto LABEL_26;
  }
LABEL_27:

  return v17;
}

- (BOOL)wasPosted
{
  v2 = [(HDClinicalAPIReminder *)self postDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_setSource:(id)a3
{
  self->_source = (HKSource *)[a3 copy];

  _objc_release_x1();
}

- (void)_setCreationDate:(id)a3
{
  self->_creationDate = (NSDate *)[a3 copy];

  _objc_release_x1();
}

- (void)_setPostDate:(id)a3
{
  self->_postDate = (NSDate *)[a3 copy];

  _objc_release_x1();
}

- (HKSource)source
{
  return self->_source;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)postDate
{
  return self->_postDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end