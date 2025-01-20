@interface GKChallengePlayerCell
- (UIImageView)chevronImageView;
- (UIView)seperatorLine;
- (void)drawRect:(CGRect)a3;
- (void)setChevronImageView:(id)a3;
- (void)setSeperatorLine:(id)a3;
@end

@implementation GKChallengePlayerCell

- (void)drawRect:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GKChallengePlayerCell;
  -[GKChallengePlayerCell drawRect:](&v9, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  v5 = [(GKChallengePlayerCell *)self seperatorLine];
  [v5 setBackgroundColor:v4];

  v6 = [(GKChallengePlayerCell *)self chevronImageView];
  [v6 setClipsToBounds:0];

  v7 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  v8 = [(GKChallengePlayerCell *)self chevronImageView];
  [v8 setTintColor:v7];
}

- (UIImageView)chevronImageView
{
  return self->_chevronImageView;
}

- (void)setChevronImageView:(id)a3
{
}

- (UIView)seperatorLine
{
  return self->_seperatorLine;
}

- (void)setSeperatorLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seperatorLine, 0);

  objc_storeStrong((id *)&self->_chevronImageView, 0);
}

@end