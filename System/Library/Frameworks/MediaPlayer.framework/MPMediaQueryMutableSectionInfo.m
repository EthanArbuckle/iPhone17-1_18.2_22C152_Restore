@interface MPMediaQueryMutableSectionInfo
- (void)addSectionWithHeaderTitle:(id)a3 sectionIndexTitleIndex:(unint64_t)a4 count:(unint64_t)a5;
@end

@implementation MPMediaQueryMutableSectionInfo

- (void)addSectionWithHeaderTitle:(id)a3 sectionIndexTitleIndex:(unint64_t)a4 count:(unint64_t)a5
{
  id v8 = a3;
  id v12 = [[MPMediaQuerySection alloc] _init];
  [v12 setTitle:v8];

  [v12 setSectionIndexTitleIndex:a4];
  objc_msgSend(v12, "setRange:", -[MPMediaQuerySectionInfo count](self, "count"), a5);
  sections = self->super._sections;
  if (!sections)
  {
    v10 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
    v11 = self->super._sections;
    self->super._sections = v10;

    sections = self->super._sections;
  }
  [(NSArray *)sections addObject:v12];
}

@end