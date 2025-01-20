@interface WFRemoteFileCell
- (WFRemoteFileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setFile:(id)a3 checked:(BOOL)a4 dateFormatter:(id)a5;
@end

@implementation WFRemoteFileCell

- (void)setFile:(id)a3 checked:(BOOL)a4 dateFormatter:(id)a5
{
  BOOL v6 = a4;
  id v32 = a3;
  id v8 = a5;
  int v9 = [v32 wfIsDirectory];
  if (v9)
  {
    v10 = [MEMORY[0x263F85308] actionKitImageNamed:@"Folder"];
  }
  else
  {
    v11 = [v32 wfFileType];
    v10 = [v11 documentIcon];
  }
  v12 = [v32 wfPath];
  v13 = [v12 lastPathComponent];
  v14 = [(WFRemoteFileCell *)self textLabel];
  [v14 setText:v13];

  v15 = [v10 UIImage];
  v16 = [(WFRemoteFileCell *)self imageView];
  [v16 setImage:v15];

  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  v18 = [v32 wfFileSize];
  uint64_t v19 = [v18 longLongValue];

  v20 = [MEMORY[0x263F086F0] stringFromByteCount:v19 countStyle:0];
  if (v19) {
    char v21 = v9;
  }
  else {
    char v21 = 1;
  }
  if ((v21 & 1) == 0) {
    [v17 addObject:v20];
  }
  v22 = [v32 wfLastModifiedDate];
  v23 = [v8 stringFromDate:v22];

  if ([v23 length])
  {
    v24 = NSString;
    v25 = WFLocalizedString(@"modified %@");
    v26 = [v23 lowercaseString];
    v27 = objc_msgSend(v24, "localizedStringWithFormat:", v25, v26);
    [v17 addObject:v27];
  }
  v28 = [v17 componentsJoinedByString:@", "];
  v29 = [(WFRemoteFileCell *)self detailTextLabel];
  [v29 setText:v28];

  uint64_t v30 = 3;
  if (!v6) {
    uint64_t v30 = 0;
  }
  if (v9) {
    uint64_t v31 = 1;
  }
  else {
    uint64_t v31 = v30;
  }
  [(WFRemoteFileCell *)self setAccessoryType:v31];
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)WFRemoteFileCell;
  [(WFRemoteFileCell *)&v35 layoutSubviews];
  v3 = [(WFRemoteFileCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  remainder.origin.double x = v4;
  remainder.origin.double y = v6;
  remainder.size.double width = v8;
  remainder.size.double height = v10;

  memset(&v33, 0, sizeof(v33));
  v36.origin.double x = v5;
  v36.origin.double y = v7;
  v36.size.double width = v9;
  v36.size.double height = v11;
  CGRectDivide(v36, &v33, &remainder, 5.0, CGRectMinXEdge);
  CGRectDivide(remainder, &v33, &remainder, 44.0, CGRectMinXEdge);
  CGRect v37 = CGRectInset(v33, 5.0, 5.0);
  double x = v37.origin.x;
  double y = v37.origin.y;
  double width = v37.size.width;
  double height = v37.size.height;
  v16 = [(WFRemoteFileCell *)self imageView];
  objc_msgSend(v16, "setFrame:", x, y, width, height);

  id v17 = [(WFRemoteFileCell *)self textLabel];
  [v17 frame];
  double v19 = v18;
  double v21 = v20;

  double v22 = remainder.origin.x;
  double v23 = remainder.size.width;
  v24 = [(WFRemoteFileCell *)self textLabel];
  objc_msgSend(v24, "setFrame:", v22, v19, v23, v21);

  v25 = [(WFRemoteFileCell *)self detailTextLabel];
  [v25 frame];
  double v27 = v26;
  double v29 = v28;

  double v30 = remainder.origin.x;
  double v31 = remainder.size.width;
  id v32 = [(WFRemoteFileCell *)self detailTextLabel];
  objc_msgSend(v32, "setFrame:", v30, v27, v31, v29);
}

- (WFRemoteFileCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WFRemoteFileCell;
  CGFloat v4 = [(WFRemoteFileCell *)&v9 initWithStyle:3 reuseIdentifier:a4];
  CGFloat v5 = v4;
  if (v4)
  {
    CGFloat v6 = [(WFRemoteFileCell *)v4 imageView];
    [v6 setContentMode:1];

    -[WFRemoteFileCell setSeparatorInset:](v5, "setSeparatorInset:", 0.0, 49.0, 0.0, 0.0);
    CGFloat v7 = v5;
  }

  return v5;
}

@end