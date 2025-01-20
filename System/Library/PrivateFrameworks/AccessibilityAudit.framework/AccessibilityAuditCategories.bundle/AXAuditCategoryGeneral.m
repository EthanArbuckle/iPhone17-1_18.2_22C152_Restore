@interface AXAuditCategoryGeneral
- (BOOL)supportAuditGroup:(unint64_t)a3;
- (id)allSupportedAuditTypes;
- (id)caseSelectorsForAuditing;
- (void)auditHitUISize;
@end

@implementation AXAuditCategoryGeneral

- (id)caseSelectorsForAuditing
{
  if (qword_14DD0 != -1) {
    dispatch_once(&qword_14DD0, &stru_10718);
  }
  v2 = (void *)qword_14DC8;

  return v2;
}

- (id)allSupportedAuditTypes
{
  if (qword_14DE0 != -1) {
    dispatch_once(&qword_14DE0, &stru_10738);
  }
  v2 = (void *)qword_14DD8;

  return v2;
}

- (BOOL)supportAuditGroup:(unint64_t)a3
{
  return a3 & 1;
}

- (void)auditHitUISize
{
  v3 = NSStringFromSelector(a2);
  v4 = [(AXAuditCategoryGeneral *)self caseStartedForSelectorName:v3];
  if ([(AXAuditCategoryGeneral *)self shouldRunAuditTestType:AXAuditTestTypeHitRegion])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_67D0;
    v5[3] = &unk_106D0;
    v5[4] = self;
    [(AXAuditCategoryEmbedded *)self testOnAllVisibleElements:v5];
  }
  [(AXAuditCategoryGeneral *)self caseEndedForSelectorName:v3 result:v4];
}

@end