@interface GKSegmentedSectionHeaderView
- (unint64_t)sectionIndex;
- (void)applyLayoutAttributes:(id)a3;
- (void)prepareForReuse;
- (void)setSectionIndex:(unint64_t)a3;
- (void)setTitles:(id)a3;
@end

@implementation GKSegmentedSectionHeaderView

- (void)setTitles:(id)a3
{
  id v4 = a3;
  v5 = [(GKSegmentedSelectorView *)self segmentedControl];
  uint64_t v6 = [v5 numberOfSegments];
  if (v6 == [v4 count])
  {
    v7 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v8 = &unk_1E5F65CE0;
    v9 = __42__GKSegmentedSectionHeaderView_setTitles___block_invoke_2;
  }
  else
  {
    [v5 removeAllSegments];
    v7 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v8 = &unk_1E5F64278;
    v9 = __42__GKSegmentedSectionHeaderView_setTitles___block_invoke;
  }
  v7[2] = v9;
  v7[3] = v8;
  v7[4] = v5;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v7];
}

uint64_t __42__GKSegmentedSectionHeaderView_setTitles___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) insertSegmentWithTitle:a2 atIndex:a3 animated:0];
}

uint64_t __42__GKSegmentedSectionHeaderView_setTitles___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setTitle:a2 forSegmentAtIndex:a3];
}

- (void)applyLayoutAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKSegmentedSectionHeaderView;
  id v4 = a3;
  [(GKSegmentedSelectorView *)&v6 applyLayoutAttributes:v4];
  v5 = objc_msgSend(v4, "indexPath", v6.receiver, v6.super_class);

  -[GKSegmentedSectionHeaderView setSectionIndex:](self, "setSectionIndex:", [v5 section]);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)GKSegmentedSectionHeaderView;
  [(GKSegmentedSelectorView *)&v4 prepareForReuse];
  self->_sectionIndex = -1;
  v3 = [(GKSegmentedSelectorView *)self segmentedControl];
  [v3 removeAllSegments];

  [(GKSegmentedSelectorView *)self setTarget:0];
}

- (unint64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(unint64_t)a3
{
  self->_sectionIndex = a3;
}

@end