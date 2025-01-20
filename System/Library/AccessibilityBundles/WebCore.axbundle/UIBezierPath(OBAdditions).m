@interface UIBezierPath(OBAdditions)
- (__CFString)ax_descriptionForPathElement:()OBAdditions;
- (id)ax_description;
- (void)ax_enumerateElementsUsingBlock:()OBAdditions;
@end

@implementation UIBezierPath(OBAdditions)

- (void)ax_enumerateElementsUsingBlock:()OBAdditions
{
  id v4 = a1;
  id info = a3;
  CGPathApply((CGPathRef)[v4 CGPath], info, (CGPathApplierFunction)CGPathEnumerationCallback);
}

- (id)ax_description
{
  id v1 = a1;
  v2 = (const CGPath *)[v1 CGPath];
  PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(v2);
  CGFloat x = PathBoundingBox.origin.x;
  CGFloat y = PathBoundingBox.origin.y;
  CGFloat width = PathBoundingBox.size.width;
  CGFloat height = PathBoundingBox.size.height;
  BoundingBoCGFloat x = CGPathGetBoundingBox(v2);
  CGFloat v7 = BoundingBox.origin.x;
  CGFloat v8 = BoundingBox.origin.y;
  CGFloat v9 = BoundingBox.size.width;
  CGFloat v10 = BoundingBox.size.height;
  v11 = [MEMORY[0x263F089D8] string];
  [v11 appendFormat:@"%@ <%p>\n", objc_opt_class(), v1];
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  v12 = NSStringFromCGRect(v23);
  [v11 appendFormat:@"  Bounds: %@\n", v12];

  v24.origin.CGFloat x = v7;
  v24.origin.CGFloat y = v8;
  v24.size.CGFloat width = v9;
  v24.size.CGFloat height = v10;
  v13 = NSStringFromCGRect(v24);
  [v11 appendFormat:@"  Control Point Bounds: %@\n", v13];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __43__UIBezierPath_OBAdditions__ax_description__block_invoke;
  v17[3] = &unk_2650B7EC8;
  id v18 = v11;
  id v19 = v1;
  id v14 = v11;
  objc_msgSend(v1, "ax_enumerateElementsUsingBlock:", v17);
  v15 = (void *)[v14 copy];

  return v15;
}

- (__CFString)ax_descriptionForPathElement:()OBAdditions
{
  switch(*(_DWORD *)a3)
  {
    case 0:
      v3 = *(uint64_t **)(a3 + 8);
      uint64_t v4 = *v3;
      uint64_t v5 = v3[1];
      v6 = NSString;
      CGFloat v7 = @"moveto";
      goto LABEL_5;
    case 1:
      CGFloat v9 = *(uint64_t **)(a3 + 8);
      uint64_t v4 = *v9;
      uint64_t v5 = v9[1];
      v6 = NSString;
      CGFloat v7 = @"lineto";
LABEL_5:
      [v6 stringWithFormat:@"%f %f %@", v4, v5, v7, v12, v13, v14, v15];
      goto LABEL_8;
    case 2:
      [NSString stringWithFormat:@"%f %f %f %f %@", **(void **)(a3 + 8), *(void *)(*(void *)(a3 + 8) + 8), *(void *)(*(void *)(a3 + 8) + 16), *(void *)(*(void *)(a3 + 8) + 24), @"quadcurveto", v14, v15];
      goto LABEL_8;
    case 3:
      CGFloat v10 = *(void **)(a3 + 8);
      [NSString stringWithFormat:@"%f %f %f %f %f %f %@", *v10, v10[1], v10[2], v10[3], v10[4], v10[5], @"curveto"];
LABEL_8:
      CGFloat v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      CGFloat v8 = @"closepath";
      break;
    default:
      CGFloat v8 = 0;
      break;
  }

  return v8;
}

@end