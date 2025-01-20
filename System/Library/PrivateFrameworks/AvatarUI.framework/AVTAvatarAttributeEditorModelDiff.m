@interface AVTAvatarAttributeEditorModelDiff
- (AVTAvatarAttributeEditorModelDiff)initWithSectionDiffs:(id)a3 sectionItemDiffs:(id)a4;
- (NSArray)sectionDiffs;
- (NSDictionary)sectionItemDiffs;
@end

@implementation AVTAvatarAttributeEditorModelDiff

- (AVTAvatarAttributeEditorModelDiff)initWithSectionDiffs:(id)a3 sectionItemDiffs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarAttributeEditorModelDiff;
  v9 = [(AVTAvatarAttributeEditorModelDiff *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sectionDiffs, a3);
    objc_storeStrong((id *)&v10->_sectionItemDiffs, a4);
  }

  return v10;
}

- (NSArray)sectionDiffs
{
  return self->_sectionDiffs;
}

- (NSDictionary)sectionItemDiffs
{
  return self->_sectionItemDiffs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionItemDiffs, 0);
  objc_storeStrong((id *)&self->_sectionDiffs, 0);
}

@end