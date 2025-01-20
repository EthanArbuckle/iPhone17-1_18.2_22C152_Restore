@interface AXInvertColors_ChatKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_ChatKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKAttachmentCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKImageBalloonView", @"tailMask", "@", 0);
  [v3 validateClass:@"CKAppManagerAppTableViewCell" isKindOfClass:@"UITableViewCell"];
  [v3 validateClass:@"CKAppManagerAppTableViewCell" isKindOfClass:@"UIView"];
  [v3 validateClass:@"CKAppGrabberView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKAppGrabberView", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserDragViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserDragViewController", @"normalDragView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKBrowserDragViewController", @"keyboardDragView", "@", 0);
  [v3 validateClass:@"CKAppGrabberView" hasInstanceVariable:@"_iconImageView" withType:"UIImageView"];
  [v3 validateClass:@"CKAppGrabberView" hasInstanceVariable:@"_headerView" withType:"UIView"];
  [v3 validateClass:@"CKBalloonTextView"];
  [v3 validateClass:@"CKBigEmojiBalloonView"];
  [v3 validateClass:@"CKTextMessagePartChatItem"];
  [v3 validateClass:@"CKTextMessagePartChatItem" isKindOfClass:@"CKMessagePartChatItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessagePartChatItem", @"isFromMe", "B", 0);
  [v3 validateClass:@"CKTextBalloonView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"CKTextBalloonView" hasProperty:@"textView" withType:"@"];
  [v3 validateClass:@"CKTextBalloonView" hasProperty:@"delegate" withType:"@"];
  [v3 validateClass:@"CKTextBalloonView" isKindOfClass:@"CKColoredBalloonView"];
  [v3 validateClass:@"CKColoredBalloonView" hasProperty:@"color" withType:"c"];
  [v3 validateClass:@"CKTranscriptBalloonCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTranscriptCollectionViewController", @"chatItems", "@", 0);
  [v3 validateClass:@"CKMessageEntryContentView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"CKMessageEntryContentView" hasProperty:@"textView" withType:"@"];
  [v3 validateClass:@"CKMessageEntryContentView" hasProperty:@"subjectView" withType:"@"];
  [v3 validateClass:@"CKMessageEntryRichTextView" isKindOfClass:@"UITextView"];
  [v3 validateClass:@"CKInlineStickerBalloonView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"CKTranscriptBalloonCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"CKTranscriptBalloonCell" hasProperty:@"balloonView" withType:"@"];
  [v3 validateClass:@"CKTranscriptCollectionViewController" hasProperty:@"collectionView" withType:"@"];
  [v3 validateClass:@"CKTranscriptCollectionView" isKindOfClass:@"UICollectionView"];
  [v3 validateClass:@"CKTranscriptCollectionViewController" conformsToProtocol:@"UIScrollViewDelegate"];
  [v3 validateClass:@"CKConversationListStandardCell" isKindOfClass:@"UIView"];
  [v3 validateClass:@"CKMessageEntryView" hasProperty:@"collpasedPlaceholderLabel" withType:"@"];
  [v3 validateClass:@"CKConversationListStandardCell" hasInstanceVariable:@"_summaryLabel" withType:"UILabel"];
  [v3 validateClass:@"CKConversationListStandardCell" hasInstanceVariable:@"_fromLabel" withType:"CKLabel"];
  [v3 validateClass:@"CKLabel" isKindOfClass:@"UILabel"];
  [v3 validateClass:@"CKAttachmentSearchResultCell" isKindOfClass:@"CKEditableSearchResultCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKEditableSearchResultCell", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"UIColor", @"_labelColor", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"UIColor", @"_secondaryLabelColor", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"CKImageBalloonViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKAttachmentCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKBrowserPluginCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKAppManagerAppTableViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKAppGrabberViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKBrowserDragViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKBalloonTextViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKColoredBalloonViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKAssociatedStickerTranscriptCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKInlineStickerBalloonViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKTranscriptCollectionViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKConversationListStandardCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKMessageEntryViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKAttachmentSearchResultCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"CKPhotoSearchResultCellInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end