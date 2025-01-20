@interface CKContextSharedExtractionHelper
+ (BOOL)_isRelevantForExtractionWithView:(id)a3;
+ (BOOL)elementIsOnScreenWithView:(id)a3 window:(id)a4;
+ (BOOL)textBlockLooksLikeAListWithText:(id)a3;
+ (id)bestContentStringForWebViewUIElements:(id)a3 andTitle:(id)a4;
+ (id)bestImageForView:(id)a3;
+ (id)blocksFromText:(id)a3;
+ (id)webPageNodeExtractionJavaScript;
+ (void)descendantsRelevantForContentExtractionFromView:(id)a3 intoArray:(id)a4;
@end

@implementation CKContextSharedExtractionHelper

+ (id)webPageNodeExtractionJavaScript
{
  return @"let traversed=null;function retrieveNodeInformation(){traversed=new Set;let e,t=document.createNodeIterator(document.body,NodeFilter.SHOW_ELEMENT),n=[];for (;e=t.nextNode();){if (traversed.has(e))continue;let t=elementBoundingBoxInPage(e),o=t.height>10&&t.width>30,i=elementIsVisibleInViewport(e);if (!o||elementIsHidden(e))continue;let r=[].map.call(e.childNodes,(function(e){return nodeText='',3==e.nodeType?nodeText=e.nodeValue.trim():['A', 'B', 'L', 'U', 'LI'].indexOf(e.nodeName)>=0&&(traversed.add(e),nodeText=e.innerText.trim()),nodeText||void 0})).filter((e=>null!=e)).join(', ').trim(),[d,l]=shouldGetAllText(e);d&&(r=getAllText(e).join(', ').trim());let s=elementOriginPagesFromViewport(t),w=/^(.)\x01+$/.test(r);r.length>=3&&r.length<350&&!w&&(node={text:r,className:l,left:t.left,right:t.right,top:t.top,bottom:t.bottom,onScreen:i?1:0,pagesFromViewport:s},n.push(node),n.length>250&&(n[0].pagesFromViewPort>node.pagesFromViewPort?n.shift():n.pop()))}return traversed=null,JSON.stringify({nodes:n})}function shouldGetAllText(e){const t=e.getAttribute('itemtype');if (t&&t.includes('schema.org/'))return[!0,t];const n=e.nodeName;return n&&['address'].includes(n.toString().toLowerCase())?[!0,n]:[!1,null]}function getAllText(e){return traversed.add(e),[].flatMap.call(e.childNodes,(function(e){if (e.nodeType!=Node.ELEMENT_NODE||!elementIsHidden(e)){if (e.nodeType==Node.TEXT_NODE){let t=e.nodeValue.trim();return t||void 0}return getAllText(e)}})).filter((e=>!['|',',',void 0].includes(e)))}function elementBoundingBoxInPage(e){let t=e.getBoundingClientRect();return{left:t.left+window.scrollX,right:t.right+window.scrollX,top:t.top+window.scrollY,bottom:t.bottom+window.scrollY,width:t.width,height:t.height}}function elementIsVisibleInViewport(e){const t=e.getBoundingClientRect();if (!(t.top<window.innerHeight&&t.left<window.innerWidth&&t.bottom>0&&t.right>0))return!1;const n={x:t.left+t.width/2,y:t.top+t.height/2};let o=e,i=document.elementFromPoint(n.x,n.y);if (null==i)return!1;do{if (i===o)return!0}while (o=o.parentNode);do{if (i===e)return!0}while (i=i.parentNode);return!1}function elementIsHidden(e){const t=window.getComputedStyle(e);return'none'===t.display||'visible'!==t.visibility||'0'===t.opacity}function elementOriginPagesFromViewport(e){let t=0,n=0;return e.top<window.pageYOffset?t=window.pageYOffset-e.top:e.top>window.pageYOffset+window.innerHeight&&(t=e.top-window.pageYOffset-window.innerHeight),e.left<window.pageXOffset?n=window.pageXOffset-e.left:e.left>window.pageXOffset+window.innerWidth&&(n=e.left-window.pageXOffset-window.innerWidth),t=Math.floor(t/window.innerHeight),n=Math.floor(n/window.innerWidth),Math.max(t,n)}retrieveNodeInformation();";
}

+ (id)blocksFromText:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = [v3 whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v6 length])
  {
    if (blockCleanUpRegularExpression_once != -1) {
      dispatch_once(&blockCleanUpRegularExpression_once, &__block_literal_global);
    }
    id v7 = (id)blockCleanUpRegularExpression_regex;
    v8 = objc_msgSend(v7, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), @"\n\n");

    v9 = [v8 componentsSeparatedByString:@"\n\n"];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)textBlockLooksLikeAListWithText:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [&unk_1F0E605C8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(&unk_1F0E605C8);
        }
        v8 = [v3 componentsSeparatedByString:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        if ((unint64_t)([v8 count] - 1) >= 6)
        {
          id v9 = v8;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (!v11)
          {

LABEL_23:
            BOOL v16 = 1;
            goto LABEL_24;
          }
          uint64_t v12 = v11;
          unint64_t v13 = 0;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v10);
              }
              if ((unint64_t)[*(id *)(*((void *)&v18 + 1) + 8 * j) length] > 0x54) {
                ++v13;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);

          if (!v13 || (double)v13 / (double)(unint64_t)[v10 count] < 0.25) {
            goto LABEL_23;
          }
        }
      }
      uint64_t v5 = [&unk_1F0E605C8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_24:

  return v16;
}

+ (void)descendantsRelevantForContentExtractionFromView:(id)a3 intoArray:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([a1 _isRelevantForExtractionWithView:v6])
  {
    [v7 addObject:v6];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v8 = objc_msgSend(v6, "subviews", 0);
    id v9 = [v8 reverseObjectEnumerator];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
          if (![v6 clipsToBounds]) {
            goto LABEL_9;
          }
          [v6 bounds];
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          CGFloat v22 = v21;
          [v14 frame];
          v34.origin.x = v23;
          v34.origin.y = v24;
          v34.size.width = v25;
          v34.size.height = v26;
          v33.origin.x = v16;
          v33.origin.y = v18;
          v33.size.width = v20;
          v33.size.height = v22;
          if (CGRectIntersectsRect(v33, v34)) {
LABEL_9:
          }
            [a1 descendantsRelevantForContentExtractionFromView:v14 intoArray:v7];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }
  }
}

+ (id)bestContentStringForWebViewUIElements:(id)a3 andTitle:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          [v13 density];
          if (v14 > 43.0)
          {
            double v15 = [v13 text];
            [v7 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    CGFloat v16 = [v7 componentsJoinedByString:@"\n\n"];
    if ([v6 length])
    {
      double v17 = &stru_1F0E5E050;
      if (v16) {
        double v17 = v16;
      }
      uint64_t v18 = [NSString stringWithFormat:@"%@%@%@", v6, @"\n\n", v17];

      CGFloat v16 = (__CFString *)v18;
    }
  }
  else
  {
    CGFloat v16 = 0;
  }

  return v16;
}

+ (BOOL)_isRelevantForExtractionWithView:(id)a3
{
  id v3 = a3;
  if ([v3 isHidden]) {
    goto LABEL_5;
  }
  [v3 alpha];
  if (v4 < 0.05) {
    goto LABEL_5;
  }
  [v3 frame];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  if (CGRectGetWidth(v13) < 30.0
    || (v14.origin.CGFloat x = x, v14.origin.y = y,
                          v14.size.CGFloat width = width,
                          v14.size.CGFloat height = height,
                          CGRectGetHeight(v14) < 17.0))
  {
LABEL_5:
    LOBYTE(v9) = 0;
  }
  else
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    int v9 = [v12 isEqualToString:@"_UIActivityContentCollectionView"] ^ 1;
  }
  return v9;
}

+ (id)bestImageForView:(id)a3
{
  id v3 = a3;
  [v3 frame];
  if (CGRectGetWidth(v11) < 40.0
    || ([v3 frame], CGRectGetHeight(v12) < 40.0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    id v6 = 0;
  }
  else
  {
    double v4 = [v3 performSelector:sel_image];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    [v5 size];
    id v6 = 0;
    if (v9 >= 250.0 && v8 >= 250.0) {
      id v6 = v5;
    }
  }

  return v6;
}

+ (BOOL)elementIsOnScreenWithView:(id)a3 window:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 bounds];
  objc_msgSend(v6, "convertRect:toView:", v5);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 frame];
  double v26 = v16;
  double v27 = v15;

  [v5 bounds];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v28.origin.CGFloat x = v8;
  v28.origin.CGFloat y = v10;
  v28.size.CGFloat width = v12;
  v28.size.CGFloat height = v14;
  v29.origin.CGFloat x = v18;
  v29.origin.CGFloat y = v20;
  v29.size.CGFloat width = v22;
  v29.size.CGFloat height = v24;
  BOOL result = CGRectIntersectsRect(v28, v29);
  if (v26 + v27 <= 0.0) {
    return 0;
  }
  return result;
}

@end