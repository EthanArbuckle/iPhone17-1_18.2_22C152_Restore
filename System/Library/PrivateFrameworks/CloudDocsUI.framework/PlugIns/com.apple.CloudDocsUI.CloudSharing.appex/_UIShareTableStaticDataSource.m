@interface _UIShareTableStaticDataSource
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSArray)sections;
- (UITableView)tableView;
- (_UIShareTableStaticDataSource)init;
- (_UIShareTableStaticDataSource)initWithTableView:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)defaultTarget;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 editActionsForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)target;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_toggleValueChanged:(id)a3;
- (void)_updateEstimatedHeightsForDynamicTypeChange;
- (void)menuWillHide:(id)a3;
- (void)setDefaultTarget:(id)a3;
- (void)setSections:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
@end

@implementation _UIShareTableStaticDataSource

- (_UIShareTableStaticDataSource)initWithTableView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIShareTableStaticDataSource;
  v5 = [(_UIShareTableStaticDataSource *)&v8 init];
  if (v5)
  {
    [v4 setDelegate:v5];
    [v4 setDataSource:v5];
    [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"action"];
    [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"link"];
    [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"toggle"];
    [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"radio"];
    [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"centered"];
    [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"subtitle"];
    [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"header"];
    [v4 setRowHeight:UITableViewAutomaticDimension];
    [v4 setSectionFooterHeight:UITableViewAutomaticDimension];
    [v4 setSectionHeaderHeight:UITableViewAutomaticDimension];
    [(_UIShareTableStaticDataSource *)v5 setTableView:v4];
    [(_UIShareTableStaticDataSource *)v5 _updateEstimatedHeightsForDynamicTypeChange];
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_updateEstimatedHeightsForDynamicTypeChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v5;
}

- (void)_updateEstimatedHeightsForDynamicTypeChange
{
  v3 = +[UIFontMetrics defaultMetrics];
  [v3 scaledValueForValue:44.0];
  double v5 = v4;

  id v6 = [(_UIShareTableStaticDataSource *)self tableView];
  [v6 setEstimatedRowHeight:v5];
  [v6 setEstimatedSectionHeaderHeight:v5];
  [v6 setEstimatedSectionFooterHeight:v5];
}

- (_UIShareTableStaticDataSource)init
{
  uint64_t v3 = objc_opt_class();
  double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[_UIShareTableStaticDataSource init]");
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"-[%@ %@] is unavailable, use the one of the designated initializers instead.", v3, v4);

  return 0;
}

- (id)target
{
  uint64_t v3 = [(_UIShareTableStaticDataSource *)self defaultTarget];
  double v4 = v3;
  if (!v3) {
    uint64_t v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (NSArray)sections
{
  return self->_sections;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(_UIShareTableStaticDataSource *)self sections];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(_UIShareTableStaticDataSource *)self sections];
  id v6 = [v5 objectAtIndex:a4];

  v7 = [v6 objectForKey:@"items"];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIShareTableStaticDataSource *)self sections];
  v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "section"));

  v10 = [v9 objectForKey:@"items"];
  v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row"));

  v12 = [v11 objectForKey:@"type"];
  uint64_t v13 = [v11 objectForKey:@"celltype"];
  v14 = (void *)v13;
  if (v13) {
    v15 = (void *)v13;
  }
  else {
    v15 = v12;
  }
  v16 = v15;

  v17 = [v6 dequeueReusableCellWithIdentifier:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v114 = v6;
    v18 = v16;
    id v19 = v17;
    v20 = [v11 objectForKey:@"shareElementImage"];
    [v19 sharedItemThumnail];
    id v21 = v7;
    v23 = v22 = v9;
    [v23 setImage:v20];

    v24 = [v11 objectForKey:@"title"];
    v25 = [v19 sharedItemLabel];
    [v25 setText:v24];

    v26 = [v11 objectForKey:@"detail"];
    v27 = [v19 sharedWithinLabel];
    [v27 setText:v26];

    v28 = [v11 objectForKey:@"sharedByModifiedBy"];
    v29 = [v19 sharedByModifiedByLabel];
    [v29 setText:v28];

    v30 = [v11 objectForKey:@"shareElementBadge"];
    v31 = +[NSNull null];
    v32 = v11;
    if (v30 == v31) {
      v33 = 0;
    }
    else {
      v33 = v30;
    }
    [v19 sharedItemBadge];
    v35 = v34 = v12;
    v36 = v33;
    v11 = v32;
    [v35 setImage:v36];

    v12 = v34;
    v16 = v18;
    id v6 = v114;

    v37 = v22;
    id v7 = v21;

    goto LABEL_56;
  }
  v38 = [v11 objectForKey:@"target"];
  v39 = v38;
  if (v38)
  {
    v40 = v38;
  }
  else
  {
    v40 = [(_UIShareTableStaticDataSource *)self target];
  }
  v41 = v40;

  if ([v17 conformsToProtocol:&OBJC_PROTOCOL____UIShareTableValueCell])
  {
    v42 = [v11 objectForKey:@"value"];
    [v17 setRepresentedValue:v42];
  }
  v43 = [v11 objectForKey:@"enabled"];
  v113 = v41;
  v111 = v43;
  v44 = v9;
  if (v43) {
    uint64_t v45 = (uint64_t)[v43 BOOLValue];
  }
  else {
    uint64_t v45 = 1;
  }
  v46 = [v17 textLabel];
  [v46 setEnabled:v45];

  v47 = [v17 textLabel];
  [v47 setLineBreakMode:0];

  v48 = [v17 textLabel];
  [v48 setNumberOfLines:3];

  v49 = [v17 detailTextLabel];
  [v49 setEnabled:v45];

  v50 = [v11 objectForKey:@"title"];
  v51 = [v17 textLabel];
  [v51 setText:v50];

  v52 = [v11 objectForKey:@"axIdentifier"];
  [v17 setAccessibilityIdentifier:v52];

  if ([v12 isEqual:@"radio"])
  {
    v53 = [v11 objectForKey:@"key"];
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_100012028;
    v116[3] = &unk_10004CE78;
    v117 = v113;
    id v115 = v53;
    id v118 = v115;
    v54 = objc_retainBlock(v116);
    v55 = [v11 objectForKey:@"value"];
    v112 = (uint64_t (**)(void, void))v54;
    LODWORD(v54) = ((uint64_t (*)(void *, void *))v54[2])(v54, v55);

    v107 = v12;
    if (v54)
    {
      [v17 setAccessoryView:0];
      [v17 setAccessoryType:3];
      v37 = v44;
    }
    else
    {
      v109 = v16;
      id v106 = v7;
      v60 = [v44 objectForKey:@"items"];
      if ([v60 count])
      {
        for (unint64_t i = 0; i < (unint64_t)[v60 count]; ++i)
        {
          v62 = [v60 objectAtIndex:i];
          v63 = [v62 objectForKey:@"type"];
          if ([v63 isEqual:@"radio"])
          {
            v64 = [v62 objectForKey:@"key"];
            unsigned int v65 = [v64 isEqual:v115];

            if (v65)
            {
              v66 = [v62 valueForKey:@"value"];
              int v67 = ((uint64_t (**)(void, void *))v112)[2](v112, v66);

              if (v67)
              {

                [v17 setAccessoryType:0];
                [v17 setAccessoryView:0];
                goto LABEL_32;
              }
            }
          }
          else
          {
          }
        }
      }
      [v17 setAccessoryType:0];
      id v68 = objc_alloc((Class)UIImageView);
      v69 = +[UIImage imageNamed:@"IndeterminateDash"];
      id v70 = [v68 initWithImage:v69];
      [v17 setAccessoryView:v70];

LABEL_32:
      id v7 = v106;
      v16 = v109;
      v37 = v44;
    }
    v71 = v113;
    v72 = [v11 objectForKey:@"detail"];
    if (v72)
    {
      [v17 detailTextLabel];
      v74 = v73 = v37;
      [v74 setText:v72];

      v75 = +[UIColor secondaryLabelColor];
      [v17 detailTextLabel];
      v77 = v76 = v11;
      [v77 setTextColor:v75];

      v11 = v76;
      v37 = v73;
      v71 = v113;
    }

    v12 = v107;
    goto LABEL_55;
  }
  v37 = v44;
  if ([v12 isEqual:@"action"])
  {
    v108 = v16;
    v56 = [v11 objectForKey:@"detail"];
    id v105 = v7;
    v110 = v44;
    if (v56)
    {
      v57 = [v17 detailTextLabel];
      [v57 setText:v56];

      v58 = +[UIColor secondaryLabelColor];
      v59 = [v17 detailTextLabel];
      [v59 setTextColor:v58];
    }
    else
    {
      v85 = [v17 textLabel];
      [v85 setTextAlignment:1];

      v86 = [v17 detailTextLabel];
      [v86 setText:0];

      if (v108 == @"centered")
      {
LABEL_41:
        v88 = [v11 objectForKey:@"accessibilityLabel"];
        if (v88)
        {
          [v17 setIsAccessibilityElement:1];
          [v17 setAccessibilityLabel:v88];
        }
        v89 = v12;
        v90 = [v11 objectForKey:@"accessibilityHint"];
        if (v90)
        {
          [v17 setIsAccessibilityElement:1];
          [v17 setAccessibilityHint:v90];
        }
        v91 = v11;
        v92 = [v11 objectForKey:@"destructive"];
        unsigned int v93 = [v92 BOOLValue];
        v94 = [v17 textLabel];
        v95 = v94;
        if (v93)
        {
          [v94 _setTextColorFollowsTintColor:0];

          v96 = +[UIColor systemRedColor];
          v97 = [v17 textLabel];
          [v97 setTextColor:v96];
        }
        else
        {
          [v94 setTextColor:0];

          v96 = [v17 textLabel];
          [v96 _setTextColorFollowsTintColor:v56 == 0];
        }
        v11 = v91;
        v12 = v89;
        v71 = v113;

        id v7 = v105;
LABEL_54:
        v16 = v108;
        v37 = v110;
        goto LABEL_55;
      }
    }
    v87 = [v11 objectForKey:@"action"];

    [v17 setAccessoryType:v87 != 0];
    goto LABEL_41;
  }
  v71 = v113;
  if ([v12 isEqual:@"toggle"])
  {
    v108 = v16;
    id v78 = objc_alloc_init((Class)UISwitch);
    [v17 setAccessoryView:v78];
    v79 = [v11 objectForKey:@"action"];

    v110 = v37;
    if (v79)
    {
      v80 = [v11 objectForKey:@"action"];
      SEL v81 = NSSelectorFromString(v80);

      v82 = v78;
      v83 = v113;
      v84 = v81;
    }
    else
    {
      objc_setAssociatedObject(v78, &unk_100061C90, v11, (void *)0x301);
      v84 = "_toggleValueChanged:";
      v82 = v78;
      v83 = self;
    }
    [v82 addTarget:v83 action:v84 forControlEvents:4096];
    v98 = [v11 objectForKey:@"toggleCreationCallback"];

    if (v98)
    {
      v99 = [v11 objectForKey:@"toggleCreationCallback"];
      SEL v100 = NSSelectorFromString(v99);

      if (objc_opt_respondsToSelector()) {
        ((void (*)(_UIShareTableStaticDataSource *, SEL, id))[(_UIShareTableStaticDataSource *)v113 methodForSelector:v100])(v113, v100, v78);
      }
    }
    v101 = [v11 objectForKey:@"key"];
    v102 = [(_UIShareTableStaticDataSource *)v113 valueForKey:v101];
    objc_msgSend(v78, "setOn:", objc_msgSend(v102, "BOOLValue"));

    goto LABEL_54;
  }
LABEL_55:
  id v103 = v17;

LABEL_56:

  return v17;
}

- (void)_toggleValueChanged:(id)a3
{
  id v4 = a3;
  objc_getAssociatedObject(v4, &unk_100061C90);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v12 objectForKey:@"target"];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(_UIShareTableStaticDataSource *)self target];
  }
  id v8 = v7;

  id v9 = [v4 isOn];
  v10 = +[NSNumber numberWithBool:v9];
  v11 = [v12 objectForKey:@"key"];
  [v8 setValue:v10 forKey:v11];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIShareTableStaticDataSource *)self sections];
  id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "section"));

  id v8 = [v7 objectForKey:@"items"];
  id v9 = [v5 row];

  v10 = [v8 objectAtIndex:v9];

  v11 = [v10 objectForKey:@"type"];
  if (([v11 isEqual:@"radio"] & 1) == 0)
  {
    if ([v11 isEqual:@"action"])
    {
      id v12 = [v10 objectForKey:@"action"];
      if (v12)
      {

        goto LABEL_6;
      }
      if ([v11 isEqual:@"link"]) {
        goto LABEL_6;
      }
    }
    else if ([v11 isEqual:@"link"])
    {
      goto LABEL_6;
    }
    unsigned __int8 v15 = 0;
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v13 = [v10 objectForKey:@"enabled"];
  v14 = v13;
  if (v13) {
    unsigned __int8 v15 = [v13 BOOLValue];
  }
  else {
    unsigned __int8 v15 = 1;
  }

LABEL_10:
  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v46 = a3;
  id v6 = a4;
  id v7 = [(_UIShareTableStaticDataSource *)self sections];
  id v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "section"));

  id v9 = [v8 objectForKey:@"items"];
  uint64_t v45 = v6;
  v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));

  v11 = [v10 objectForKey:@"type"];
  id v12 = [v10 objectForKey:@"target"];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [(_UIShareTableStaticDataSource *)self target];
  }
  unsigned __int8 v15 = v14;

  if ([v11 isEqual:@"radio"])
  {
    v44 = v11;
    v16 = [v10 objectForKey:@"key"];
    v43 = v10;
    v41 = [v10 objectForKey:@"value"];
    v42 = v15;
    objc_msgSend(v15, "setValue:forKey:");
    v17 = [v8 objectForKey:@"items"];
    if ([v17 count])
    {
      uint64_t v18 = 0;
      while (1)
      {
        id v19 = [v17 objectAtIndex:v18];
        v20 = [v19 objectForKey:@"type"];
        if (![v20 isEqual:@"radio"]) {
          goto LABEL_10;
        }
        id v21 = [v19 objectForKey:@"key"];
        unsigned int v22 = [v21 isEqual:v16];

        if (v22) {
          break;
        }
LABEL_11:

        if (++v18 >= (unint64_t)[v17 count]) {
          goto LABEL_12;
        }
      }
      v20 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v18, [v45 section]);
      v48 = v20;
      v23 = +[NSArray arrayWithObjects:&v48 count:1];
      [v46 reloadRowsAtIndexPaths:v23 withRowAnimation:100];

LABEL_10:
      goto LABEL_11;
    }
LABEL_12:

    v10 = v43;
    v11 = v44;
    unsigned __int8 v15 = v42;
  }
  else if ([v11 isEqual:@"action"])
  {
    v24 = [v10 objectForKey:@"action"];
    SEL v25 = NSSelectorFromString(v24);

    v26 = [v10 objectForKey:@"param"];
    v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = [v46 cellForRowAtIndexPath:v45];
    }
    v40 = v28;

    [v15 performSelector:v25 withObject:v40];
  }
  else if ([v11 isEqual:@"link"])
  {
    [v46 cellForRowAtIndexPath:v6];
    v30 = v29 = v15;
    v31 = [v30 window];
    [v31 makeKeyWindow];

    [v30 becomeFirstResponder];
    v32 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v33 = [v32 localizedStringForKey:@"COPY_LINK_ACTION_TEXT" value:@"Copy Link" table:@"Localizable"];

    id v34 = [objc_alloc((Class)UIMenuItem) initWithTitle:v33 action:"copyLink:"];
    v35 = +[UIMenuController sharedMenuController];
    id v47 = v34;
    v36 = +[NSArray arrayWithObjects:&v47 count:1];
    [v35 setMenuItems:v36];

    v37 = +[UIMenuController sharedMenuController];
    [v30 bounds];
    objc_msgSend(v37, "setTargetRect:inView:", v30);

    v38 = +[UIMenuController sharedMenuController];
    [v38 setMenuVisible:1 animated:1];

    v39 = +[NSNotificationCenter defaultCenter];
    [v39 addObserver:self selector:"menuWillHide:" name:UIMenuControllerWillHideMenuNotification object:0];

    unsigned __int8 v15 = v29;
  }
}

- (void)menuWillHide:(id)a3
{
  id v6 = [(_UIShareTableStaticDataSource *)self tableView];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIMenuControllerWillHideMenuNotification object:0];

  id v5 = [v6 indexPathForSelectedRow];
  [v6 deselectRowAtIndexPath:v5 animated:1];
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  id v7 = [a3 cellForRowAtIndexPath:a5];
  if ("copyLink:" == a4 || "copy:" == a4) {
    char v9 = objc_opt_respondsToSelector();
  }
  else {
    char v9 = 0;
  }

  return v9 & 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(_UIShareTableStaticDataSource *)self sections];
  id v6 = [v5 objectAtIndex:a4];

  id v7 = [v6 objectForKey:@"title"];
  id v8 = [v7 localizedUppercaseString];

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = [(_UIShareTableStaticDataSource *)self sections];
  id v6 = [v5 objectAtIndex:a4];

  id v7 = [v6 objectForKey:@"title"];
  if (v7)
  {
  }
  else
  {
    id v8 = [v6 objectForKey:@"hheight"];

    if (!v8) {
      goto LABEL_5;
    }
  }
  id v8 = objc_alloc_init((Class)UITableViewHeaderFooterView);
  char v9 = +[UIColor systemGrayColor];
  v10 = [v8 textLabel];
  [v10 setTextColor:v9];

LABEL_5:

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(_UIShareTableStaticDataSource *)self sections];
  id v8 = [v7 objectAtIndex:a4];

  char v9 = [v8 objectForKey:@"footer"];
  if (v9)
  {

LABEL_4:
    v10 = objc_alloc_init(_UIShareHeaderFooterView);
    v11 = [v6 backgroundColor];
    id v12 = [(_UIShareHeaderFooterView *)v10 contentView];
    [v12 setBackgroundColor:v11];

    uint64_t v13 = [v8 objectForKey:@"footer"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    unsigned __int8 v15 = [(_UIShareHeaderFooterView *)v10 centeredTitleView];
    v16 = v15;
    if (isKindOfClass) {
      [v15 setAttributedText:v13];
    }
    else {
      [v15 setText:v13];
    }

    goto LABEL_8;
  }
  v10 = [v8 objectForKey:@"fheight"];

  if (v10) {
    goto LABEL_4;
  }
LABEL_8:

  return v10;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v12 = a4;
  id v6 = a3;
  id v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  id v8 = [v12 textLabel];
  [v8 setFont:v7];

  char v9 = [v12 textLabel];
  [v9 setAdjustsFontForContentSizeCategory:1];

  v10 = [v6 backgroundColor];

  v11 = [v12 contentView];
  [v11 setBackgroundColor:v10];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = [(_UIShareTableStaticDataSource *)self sections];
  id v6 = [v5 objectAtIndex:a4];

  id v7 = [v6 objectForKey:@"hheight"];
  id v8 = v7;
  if (v7)
  {
    [v7 floatValue];
    if (v9 == 0.0)
    {
      double v11 = 2.22507386e-308;
    }
    else
    {
      [v8 floatValue];
      double v11 = v10;
    }
  }
  else
  {
    double v11 = UITableViewAutomaticDimension;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5 = [(_UIShareTableStaticDataSource *)self sections];
  id v6 = [v5 objectAtIndex:a4];

  id v7 = [v6 objectForKey:@"fheight"];
  id v8 = v7;
  if (v7)
  {
    [v7 floatValue];
    if (v9 == 0.0)
    {
      double v11 = 2.22507386e-308;
    }
    else
    {
      [v8 floatValue];
      double v11 = v10;
    }
  }
  else
  {
    double v11 = UITableViewAutomaticDimension;
  }

  return v11;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 editActionsForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIShareTableStaticDataSource *)self sections];
  float v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "section"));

  float v10 = [v9 objectForKey:@"items"];
  double v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row"));

  id v12 = [v11 objectForKey:@"target"];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [(_UIShareTableStaticDataSource *)self target];
  }
  unsigned __int8 v15 = v14;

  v16 = [v11 objectForKey:@"remact"];

  if (v16)
  {
    v17 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v18 = [v17 localizedStringForKey:@"Remove" value:@"Remove" table:@"Localizable"];
    unsigned int v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_1000130D8;
    SEL v25 = &unk_10004CEA0;
    id v26 = v11;
    id v27 = v6;
    id v28 = v7;
    id v29 = v15;
    id v19 = +[UITableViewRowAction rowActionWithStyle:0 title:v18 handler:&v22];

    v30 = v19;
    v20 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1, v22, v23, v24, v25);
  }
  else
  {
    v20 = &__NSArray0__struct;
  }

  return v20;
}

- (void)setSections:(id)a3
{
}

- (id)defaultTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_defaultTarget);

  return WeakRetained;
}

- (void)setDefaultTarget:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak(&self->_defaultTarget);

  objc_storeStrong((id *)&self->_sections, 0);
}

@end