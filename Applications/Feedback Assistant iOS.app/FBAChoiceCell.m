@interface FBAChoiceCell
- (FBKQuestionChoice)choice;
- (id)appIconForChoice:(id)a3;
- (void)evaluateSelectionWithValue:(id)a3;
- (void)evaluateSelectionWithValues:(id)a3;
- (void)setChoice:(id)a3;
- (void)updateWithChoice:(id)a3;
@end

@implementation FBAChoiceCell

- (void)updateWithChoice:(id)a3
{
  id v16 = a3;
  [(FBAChoiceCell *)self setChoice:v16];
  v4 = [(FBAChoiceCell *)self textLabel];
  [v4 setNumberOfLines:0];

  v5 = [v16 title];
  v6 = [(FBAChoiceCell *)self textLabel];
  [v6 setText:v5];

  v7 = +[UIColor labelColor];
  v8 = [(FBAChoiceCell *)self textLabel];
  [v8 setTextColor:v7];

  v9 = [(FBAChoiceCell *)self textLabel];
  [v9 setTextAlignment:0];

  v10 = [(FBAChoiceCell *)self choice];
  LODWORD(v8) = [v10 canSelect];

  if (v8)
  {
    [(FBAChoiceCell *)self setUserInteractionEnabled:1];
    +[UIColor labelColor];
  }
  else
  {
    [(FBAChoiceCell *)self setUserInteractionEnabled:0];
    +[UIColor secondaryLabelColor];
  v11 = };
  v12 = [(FBAChoiceCell *)self textLabel];
  [v12 setTextColor:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [(FBAChoiceCell *)self appIconForChoice:v16];
    v14 = [(FBAChoiceCell *)self imageView];
    [v14 setImage:v13];
  }
  v15 = +[UIColor secondarySystemGroupedBackgroundColor];
  [(FBAChoiceCell *)self setBackgroundColor:v15];
}

- (void)evaluateSelectionWithValue:(id)a3
{
  id v4 = a3;
  id v8 = [(FBAChoiceCell *)self choice];
  v5 = [v8 value];
  unsigned int v6 = [v5 isEqualToString:v4];

  if (v6) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 0;
  }
  [(FBAChoiceCell *)self setAccessoryType:v7];
}

- (void)evaluateSelectionWithValues:(id)a3
{
  id v4 = a3;
  id v8 = [(FBAChoiceCell *)self choice];
  v5 = [v8 value];
  unsigned int v6 = [v4 containsObject:v5];

  if (v6) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 0;
  }
  [(FBAChoiceCell *)self setAccessoryType:v7];
}

- (id)appIconForChoice:(id)a3
{
  id v4 = a3;
  v5 = [v4 app];

  if (v5)
  {
    unsigned int v6 = +[UIScreen mainScreen];
    [v6 scale];
    double v8 = v7;

    id v9 = objc_alloc((Class)ISIcon);
    v10 = [v4 app];
    v11 = [v10 identifier];
    id v12 = [v9 initWithBundleIdentifier:v11];

    v13 = [(FBAChoiceCell *)self textLabel];
    [v13 frame];
    double v15 = v14 * 0.6;

    id v16 = [objc_alloc((Class)ISImageDescriptor) initWithSize:v15 scale:v15];
    v17 = [v12 imageForImageDescriptor:v16];
    v18 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v17 CGImage], 0, v8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (FBKQuestionChoice)choice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_choice);

  return (FBKQuestionChoice *)WeakRetained;
}

- (void)setChoice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end