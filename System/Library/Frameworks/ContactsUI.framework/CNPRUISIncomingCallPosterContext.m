@interface CNPRUISIncomingCallPosterContext
+ (id)emptyContext;
- (CNPRUISIncomingCallPosterContext)initWithContact:(id)a3 showName:(BOOL)a4;
- (CNPRUISIncomingCallPosterContext)initWithNameVariations:(id)a3 preferredNameStyle:(unint64_t)a4 horizontalTitleBoundingRect:(CGRect)a5 verticalTitleBoundingRect:(CGRect)a6 imageAssetID:(id)a7 personalPoster:(BOOL)a8;
- (NSString)preferredTitleString;
- (NSString)titleString;
- (PRUISIncomingCallPosterContext)wrappedIncomingCallPosterContext;
@end

@implementation CNPRUISIncomingCallPosterContext

- (void).cxx_destruct
{
}

- (PRUISIncomingCallPosterContext)wrappedIncomingCallPosterContext
{
  return self->_wrappedIncomingCallPosterContext;
}

- (NSString)titleString
{
  return (NSString *)[(PRUISIncomingCallPosterContext *)self->_wrappedIncomingCallPosterContext titleString];
}

- (NSString)preferredTitleString
{
  return (NSString *)[(PRUISIncomingCallPosterContext *)self->_wrappedIncomingCallPosterContext preferredTitleString];
}

- (CNPRUISIncomingCallPosterContext)initWithContact:(id)a3 showName:(BOOL)a4
{
  id v5 = a3;
  v6 = [v5 posterName];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v7 = +[CNPRUISIncomingCallPosterContext emptyContext];
  }
  else
  {
    v8 = [MEMORY[0x1E4F5A6D8] unifiedMeContactMonitor];
    uint64_t v9 = [v8 isMeContact:v5];

    id v10 = objc_alloc(MEMORY[0x1E4FB1F48]);
    v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 bounds];
    v12 = objc_msgSend(v10, "initWithFrame:");

    +[CNIncomingCallSnapshotViewController horizontalNameLabelBoundingRectForName:v6 window:v12];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    +[CNIncomingCallSnapshotViewController verticalNameLabelBoundingRectForName:v6 window:v12];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v29 = [[CNPRUISIncomingCallPosterContextNameVariations alloc] initWithShortName:v6 fullName:0];
    self = -[CNPRUISIncomingCallPosterContext initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:](self, "initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", v29, 0, 0, v9, v14, v16, v18, v20, v22, v24, v26, v28);

    v7 = self;
  }

  return v7;
}

- (CNPRUISIncomingCallPosterContext)initWithNameVariations:(id)a3 preferredNameStyle:(unint64_t)a4 horizontalTitleBoundingRect:(CGRect)a5 verticalTitleBoundingRect:(CGRect)a6 imageAssetID:(id)a7 personalPoster:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v14 = a5.size.height;
  double v15 = a5.size.width;
  double v16 = a5.origin.y;
  double v17 = a5.origin.x;
  id v20 = a3;
  id v21 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CNPRUISIncomingCallPosterContext;
  double v22 = [(CNPRUISIncomingCallPosterContext *)&v28 init];
  if (v22)
  {
    id v23 = objc_alloc((Class)getPRUISIncomingCallPosterContextClass[0]());
    double v24 = [v20 wrappedNameVariations];
    uint64_t v25 = objc_msgSend(v23, "initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", v24, a4 == 1, v21, v8, v17, v16, v15, v14, x, y, width, height);
    wrappedIncomingCallPosterContext = v22->_wrappedIncomingCallPosterContext;
    v22->_wrappedIncomingCallPosterContext = (PRUISIncomingCallPosterContext *)v25;
  }
  return v22;
}

+ (id)emptyContext
{
  id v2 = objc_alloc((Class)a1);
  v3 = objc_msgSend(v2, "initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", 0, 0, 0, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v3;
}

@end