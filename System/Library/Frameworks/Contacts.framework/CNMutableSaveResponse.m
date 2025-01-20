@interface CNMutableSaveResponse
+ (BOOL)supportsSecureCoding;
- (void)setContactSnapshot:(id)a3 forIndexPath:(id)a4;
- (void)setContainerSnapshot:(id)a3 forIndexPath:(id)a4;
- (void)setDidAffectMeCard:(BOOL)a3;
- (void)setGroupSnapshot:(id)a3 forIndexPath:(id)a4;
@end

@implementation CNMutableSaveResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setContactSnapshot:(id)a3 forIndexPath:(id)a4
{
  contactSnapshotsByIndexPath = self->super._contactSnapshotsByIndexPath;
  uint64_t v6 = *MEMORY[0x1E4F5A2A8];
  v7 = *(void (**)(uint64_t, id))(*MEMORY[0x1E4F5A2A8] + 16);
  id v8 = a4;
  v7(v6, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)contactSnapshotsByIndexPath setObject:v9 forKey:v8];
}

- (void)setGroupSnapshot:(id)a3 forIndexPath:(id)a4
{
  groupSnapshotsByIndexPath = self->super._groupSnapshotsByIndexPath;
  uint64_t v6 = *MEMORY[0x1E4F5A2A8];
  v7 = *(void (**)(uint64_t, id))(*MEMORY[0x1E4F5A2A8] + 16);
  id v8 = a4;
  v7(v6, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)groupSnapshotsByIndexPath setObject:v9 forKey:v8];
}

- (void)setContainerSnapshot:(id)a3 forIndexPath:(id)a4
{
  containerSnapshotsByIndexPath = self->super._containerSnapshotsByIndexPath;
  uint64_t v6 = *MEMORY[0x1E4F5A2A8];
  v7 = *(void (**)(uint64_t, id))(*MEMORY[0x1E4F5A2A8] + 16);
  id v8 = a4;
  v7(v6, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)containerSnapshotsByIndexPath setObject:v9 forKey:v8];
}

- (void)setDidAffectMeCard:(BOOL)a3
{
  self->super._didAffectMeCard = a3;
}

@end