@interface MMGenerator
- (id)generateHTML:(id)a3;
- (void)_generateHTMLForElement:(id)a3 inDocument:(id)a4 HTML:(id)a5 location:(unint64_t *)a6;
@end

@implementation MMGenerator

- (void)_generateHTMLForElement:(id)a3 inDocument:(id)a4 HTML:(id)a5 location:(unint64_t *)a6
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  v13 = 0;
  switch([v12 type])
  {
    case 1u:
      objc_msgSend(NSString, "stringWithFormat:", @"<h%u>", objc_msgSend(v12, "level"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    case 2u:
      v13 = @"<p>";
      goto LABEL_46;
    case 3u:
      v13 = @"<blockquote>\n";
      goto LABEL_46;
    case 4u:
      v13 = @"<ol>\n";
      goto LABEL_46;
    case 5u:
      v13 = @"<ul>\n";
      goto LABEL_46;
    case 6u:
      v13 = @"<li>";
      goto LABEL_46;
    case 7u:
      v15 = [v12 language];
      if (v15)
      {
        v16 = NSString;
        v17 = [v12 language];
        [v16 stringWithFormat:@"<pre><code class=\"%@\">", v17];
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
      v13 = @"<pre><code>";
      goto LABEL_37;
    case 8u:
      v13 = @"\n<hr />\n";
      goto LABEL_46;
    case 0xAu:
      v13 = @"<br />";
      goto LABEL_46;
    case 0xBu:
      v13 = @"<del>";
      goto LABEL_46;
    case 0xCu:
      v13 = @"<strong>";
      goto LABEL_46;
    case 0xDu:
      v13 = @"<em>";
      goto LABEL_46;
    case 0xEu:
      v13 = @"<code>";
      goto LABEL_46;
    case 0xFu:
      v18 = [v12 title];

      v19 = NSString;
      v15 = [v12 href];
      v17 = __HTMLEscapedString(v15);
      v20 = [v12 stringValue];
      uint64_t v21 = __HTMLEscapedString(v20);
      v22 = (void *)v21;
      if (v18)
      {
        v23 = [v12 title];
        __HTMLEscapedString(v23);
        v24 = v51 = v15;
        [v19 stringWithFormat:@"<img src=\"%@\" alt=\"%@\" title=\"%@\" />", v17, v22, v24];
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_21:
      }
      else
      {
        [v19 stringWithFormat:@"<img src=\"%@\" alt=\"%@\" />", v17, v21];
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_36:
LABEL_37:
      }
      goto LABEL_46;
    case 0x10u:
      v25 = [v12 title];

      v26 = NSString;
      if (v25)
      {
        v27 = [v12 title];
        v28 = __HTMLEscapedString(v27);
        v29 = [v12 href];
        v30 = __HTMLEscapedString(v29);
        [v26 stringWithFormat:@"<a title=\"%@\" href=\"%@\">", v28, v30];
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = [v12 href];
        v28 = __HTMLEscapedString(v27);
        [v26 stringWithFormat:@"<a href=\"%@\">", v28];
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_46;
    case 0x11u:
      v31 = NSString;
      v51 = [v12 href];
      v17 = [v31 stringWithFormat:@"mailto:%@", v51];
      v20 = __obfuscatedEmailAddress(v17);
      v22 = [v12 href];
      v23 = __obfuscatedEmailAddress(v22);
      [v31 stringWithFormat:@"<a href=\"%@\">%@</a>", v20, v23];
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case 0x13u:
      v14 = [v12 stringValue];
      goto LABEL_45;
    case 0x14u:
      v13 = @"<table>";
      goto LABEL_46;
    case 0x15u:
      v13 = @"<thead><tr>";
      goto LABEL_46;
    case 0x16u:
      if ([v12 alignment] == 2)
      {
        v32 = @"<th align='center'>";
        goto LABEL_44;
      }
      if ([v12 alignment] == 1)
      {
        v32 = @"<th align='left'>";
        goto LABEL_44;
      }
      uint64_t v33 = [v12 alignment];
      v32 = @"<th>";
      v34 = @"<th align='right'>";
      goto LABEL_42;
    case 0x17u:
      v13 = @"<tr>";
      goto LABEL_46;
    case 0x18u:
      if ([v12 alignment] == 2)
      {
        v32 = @"<td align='center'>";
      }
      else if ([v12 alignment] == 1)
      {
        v32 = @"<td align='left'>";
      }
      else
      {
        uint64_t v33 = [v12 alignment];
        v32 = @"<td>";
        v34 = @"<td align='right'>";
LABEL_42:
        if (v33 == 3) {
          v32 = v34;
        }
      }
LABEL_44:
      v14 = v32;
LABEL_45:
      v13 = v14;
LABEL_46:

      id v35 = v12;
      int v36 = [v35 type];
      v37 = 0;
      switch(v36)
      {
        case 1:
          objc_msgSend(NSString, "stringWithFormat:", @"</h%u>\n", objc_msgSend(v35, "level"));
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
        case 2:
          v37 = @"</p>\n";
          break;
        case 3:
          v37 = @"</blockquote>\n";
          break;
        case 4:
          v37 = @"</ol>\n";
          break;
        case 5:
          v37 = @"</ul>\n";
          break;
        case 6:
          v37 = @"</li>\n";
          break;
        case 7:
          v37 = @"</code></pre>\n";
          break;
        case 11:
          v37 = @"</del>";
          break;
        case 12:
          v37 = @"</strong>";
          break;
        case 13:
          v37 = @"</em>";
          break;
        case 14:
          v37 = @"</code>";
          break;
        case 16:
          v37 = @"</a>";
          break;
        case 20:
          v37 = @"</tbody></table>";
          break;
        case 21:
          v37 = @"</tr></thead><tbody>";
          break;
        case 22:
          v37 = @"</th>";
          break;
        case 23:
          v37 = @"</tr>";
          break;
        case 24:
          v37 = @"</td>";
          break;
        default:
          break;
      }
      v49 = v37;

      if (v13) {
        [v11 appendString:v13];
      }
      v50 = v35;
      v52 = v13;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v38 = [v35 children];
      uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (!v39) {
        goto LABEL_81;
      }
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v55;
      break;
    default:
      goto LABEL_46;
  }
  do
  {
    for (uint64_t i = 0; i != v40; ++i)
    {
      if (*(void *)v55 != v41) {
        objc_enumerationMutation(v38);
      }
      v43 = *(void **)(*((void *)&v54 + 1) + 8 * i);
      if ([v43 type])
      {
        if ([v43 type] != 9)
        {
          [(MMGenerator *)self _generateHTMLForElement:v43 inDocument:v10 HTML:v11 location:a6];
          continue;
        }
        v44 = [v10 markdown];
      }
      else
      {
        v44 = [v10 markdown];
        [v43 range];
        if (!v45)
        {
          [v11 appendString:@"\n"];
          goto LABEL_78;
        }
      }
      uint64_t v46 = [v43 range];
      v48 = objc_msgSend(v44, "substringWithRange:", v46, v47);
      [v11 appendString:v48];

LABEL_78:
    }
    uint64_t v40 = [v38 countByEnumeratingWithState:&v54 objects:v58 count:16];
  }
  while (v40);
LABEL_81:

  if (v49) {
    [v11 appendString:v49];
  }
}

- (id)generateHTML:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 markdown];
  uint64_t v23 = 0;
  unint64_t v6 = [v5 length];
  v7 = [MEMORY[0x263F089D8] stringWithCapacity:(unint64_t)((double)v6 * 1.25)];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = objc_msgSend(v4, "elements", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v13 type] == 9)
        {
          v14 = [v4 markdown];
          uint64_t v15 = [v13 range];
          v17 = objc_msgSend(v14, "substringWithRange:", v15, v16);
          [v7 appendString:v17];
        }
        else
        {
          [(MMGenerator *)self _generateHTMLForElement:v13 inDocument:v4 HTML:v7 location:&v23];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

@end