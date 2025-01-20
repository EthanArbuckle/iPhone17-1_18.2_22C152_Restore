@interface MTRAccessControlClusterAccessControlEntryStruct
- (MTRAccessControlClusterAccessControlEntryStruct)init;
- (NSArray)subjects;
- (NSArray)targets;
- (NSNumber)authMode;
- (NSNumber)fabricIndex;
- (NSNumber)privilege;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAuthMode:(NSNumber *)authMode;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setPrivilege:(NSNumber *)privilege;
- (void)setSubjects:(NSArray *)subjects;
- (void)setTargets:(NSArray *)targets;
@end

@implementation MTRAccessControlClusterAccessControlEntryStruct

- (MTRAccessControlClusterAccessControlEntryStruct)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRAccessControlClusterAccessControlEntryStruct;
  v2 = [(MTRAccessControlClusterAccessControlEntryStruct *)&v10 init];
  v3 = v2;
  if (v2)
  {
    privilege = v2->_privilege;
    v2->_privilege = (NSNumber *)&unk_26F9C8620;

    authMode = v3->_authMode;
    v3->_authMode = (NSNumber *)&unk_26F9C8620;

    subjects = v3->_subjects;
    v3->_subjects = 0;

    targets = v3->_targets;
    v3->_targets = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAccessControlClusterAccessControlEntryStruct);
  v7 = objc_msgSend_privilege(self, v5, v6);
  objc_msgSend_setPrivilege_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_authMode(self, v9, v10);
  objc_msgSend_setAuthMode_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_subjects(self, v13, v14);
  objc_msgSend_setSubjects_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_targets(self, v17, v18);
  objc_msgSend_setTargets_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_fabricIndex(self, v21, v22);
  objc_msgSend_setFabricIndex_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: privilege:%@; authMode:%@; subjects:%@; targets:%@; fabricIndex:%@; >",
    v5,
    self->_privilege,
    self->_authMode,
    self->_subjects,
    self->_targets,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(NSNumber *)privilege
{
}

- (NSNumber)authMode
{
  return self->_authMode;
}

- (void)setAuthMode:(NSNumber *)authMode
{
}

- (NSArray)subjects
{
  return self->_subjects;
}

- (void)setSubjects:(NSArray *)subjects
{
}

- (NSArray)targets
{
  return self->_targets;
}

- (void)setTargets:(NSArray *)targets
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_subjects, 0);
  objc_storeStrong((id *)&self->_authMode, 0);

  objc_storeStrong((id *)&self->_privilege, 0);
}

@end