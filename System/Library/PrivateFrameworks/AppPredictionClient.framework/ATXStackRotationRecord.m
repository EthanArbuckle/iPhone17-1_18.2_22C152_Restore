@interface ATXStackRotationRecord
- (ATXStackRotationRecord)initWithInfoSuggestionId:(id)a3 clientModelId:(id)a4 criterion:(id)a5 widget:(id)a6 kind:(id)a7 intent:(id)a8 isStalenessRotation:(BOOL)a9 rotationDate:(id)a10 durationLimit:(double)a11 coolDownInterval:(double)a12;
- (BOOL)isStalenessRotation;
- (INIntent)intent;
- (NSDate)rotationDate;
- (NSString)clientModelId;
- (NSString)criterion;
- (NSString)extensionBundleId;
- (NSString)infoSuggestionId;
- (NSString)widgetKind;
- (double)coolDownInterval;
- (double)durationLimit;
@end

@implementation ATXStackRotationRecord

- (ATXStackRotationRecord)initWithInfoSuggestionId:(id)a3 clientModelId:(id)a4 criterion:(id)a5 widget:(id)a6 kind:(id)a7 intent:(id)a8 isStalenessRotation:(BOOL)a9 rotationDate:(id)a10 durationLimit:(double)a11 coolDownInterval:(double)a12
{
  id v38 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a10;
  v39.receiver = self;
  v39.super_class = (Class)ATXStackRotationRecord;
  v26 = [(ATXStackRotationRecord *)&v39 init];
  if (v26)
  {
    uint64_t v27 = [v38 copy];
    infoSuggestionId = v26->_infoSuggestionId;
    v26->_infoSuggestionId = (NSString *)v27;

    uint64_t v29 = [v20 copy];
    clientModelId = v26->_clientModelId;
    v26->_clientModelId = (NSString *)v29;

    uint64_t v31 = [v21 copy];
    criterion = v26->_criterion;
    v26->_criterion = (NSString *)v31;

    uint64_t v33 = [v22 copy];
    extensionBundleId = v26->_extensionBundleId;
    v26->_extensionBundleId = (NSString *)v33;

    uint64_t v35 = [v23 copy];
    widgetKind = v26->_widgetKind;
    v26->_widgetKind = (NSString *)v35;

    objc_storeStrong((id *)&v26->_intent, a8);
    v26->_isStalenessRotation = a9;
    objc_storeStrong((id *)&v26->_rotationDate, a10);
    v26->_durationLimit = a11;
    v26->_coolDownInterval = a12;
  }

  return v26;
}

- (NSString)infoSuggestionId
{
  return self->_infoSuggestionId;
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (NSString)criterion
{
  return self->_criterion;
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (INIntent)intent
{
  return self->_intent;
}

- (BOOL)isStalenessRotation
{
  return self->_isStalenessRotation;
}

- (NSDate)rotationDate
{
  return self->_rotationDate;
}

- (double)durationLimit
{
  return self->_durationLimit;
}

- (double)coolDownInterval
{
  return self->_coolDownInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationDate, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);

  objc_storeStrong((id *)&self->_infoSuggestionId, 0);
}

@end