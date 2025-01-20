@interface CKSwipeToReplyRules
+ (id)balloonCellFromGestureRecognizer:(id)a3 inTranscriptCollectionView:(id)a4;
@end

@implementation CKSwipeToReplyRules

+ (id)balloonCellFromGestureRecognizer:(id)a3 inTranscriptCollectionView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (CKIsRunningInMessagesNotificationExtension()
    || (objc_msgSend(v6, "_ck_isEditing") & 1) != 0
    || ([v6 isDecelerating] & 1) != 0)
  {
    goto LABEL_7;
  }
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;
  [v5 velocityInView:v6];
  double v13 = atan(v12 / v11) * 180.0 / 3.14159265;
  if (v13 < 0.0) {
    double v13 = -v13;
  }
  if (v13 > 18.0)
  {
LABEL_7:
    id v14 = 0;
  }
  else
  {
    v16 = objc_msgSend(v6, "indexPathForItemAtPoint:inSection:", 0, v8, v10);
    if (v16)
    {
      v17 = [v6 delegate];
      if ([v17 collectionView:v6 shouldAllowSwipeForItemAtIndexPath:v16])
      {
        v18 = [v6 cellForItemAtIndexPath:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v18;
          v20 = [v19 contentView];
          objc_msgSend(v6, "convertPoint:toView:", v20, v8, v10);
          double v22 = v21;
          double v24 = v23;

          int v25 = [v19 allowsSwipeToReply];
          int v26 = objc_msgSend(v19, "isPointInAllowedSwipingArea:", v22, v24);
          id v14 = 0;
          if (v25 && v26) {
            id v14 = v19;
          }
        }
        else
        {
          id v14 = 0;
        }
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
  }

  return v14;
}

@end